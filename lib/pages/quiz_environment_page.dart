import 'package:eliteboard/controllers/quiz_env_controller.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/controllers/quiz_startup_controller.dart';
import 'package:eliteboard/widgets/quiz_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'dart:convert';
import 'package:eliteboard/widgets/custom_radio.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'dart:async';
class QuizEnviroment extends StatelessWidget with WidgetsBindingObserver{
  @override
  Widget build(BuildContext context) {
    Timer t;
    WidgetsBinding.instance.addObserver(this);

    return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.assistant_photo),
              title: GetBuilder(
                  init: QuizEnvController(),
                  initState:(timer){QuizEnvController.to.quizTimerInit();},
                  builder:(timer){
                    (!timer.reached && !timer.submitExam)? t= Timer.periodic(Duration(seconds: 1),
                            (timeValue){
                              timeValue.cancel();
                              QuizEnvController.to.updateTimer();
                      }):QuizEnvController.to.isSubmited().then((value){
                      if(timer.reached || timer.submitExam){

                        if(t.isActive){
                          t.cancel();
                          print('a----------------');
                          Get.toNamed('/quizresult',arguments:{"quiz":timer.quiz,"paper":timer.paper,"timeTaken":timer.timeTaken});
                        }
                      }
                    });
                    return !timer.reached ?
                    Text('Time Remaing: '+timer.currentTime)
                        :Text("Ended");
                  }
              ),
            ),
            body: GetBuilder<QuizEnvController>(
                init: QuizEnvController(),
                initState:(_){QuizEnvController.to.getQuizQuestion();},
                dispose:(_){
                  print('removing lide cylcle tarcing');
                  QuizEnvController.to.disqualifyUser();
                  WidgetsBinding.instance.removeObserver(this);
                },
              builder:(_) {
                  if(_.paper==null){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                  }else if(_.paper.quizquestions.length<=0){
                    return Center(
                      child: Text('No questions found for quiz.',
                      style: errorText,),
                    );
                  }
                  else {

                    return WillPopScope(
                      onWillPop:QuizEnvController.to.test,
                      child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Card(
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: Get.width,
                                height: Get.height,
                                child: ListView(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                          Text('#Question ${_.currentQuestionIndex+1}', style: drwareMenuText,),
                                      ],
                                    ),
                                    drawerDevider,
                                    Text((_.paper.quizquestions[_.currentQuestionIndex].question
                                        .toString().trim()),
                                      style:paperQuestion),
                                    drawerDevider,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Options', style: drwareMenuText,),
                                      ],
                                    ),
                                    CustomRadioButton(
                                      currentSelected: _.paper.quizquestions[_.currentQuestionIndex].userans==null?null:int.parse(_.paper.quizquestions[_.currentQuestionIndex].userans)-1,
                                      horizontal: true,
                                      buttonColor: Theme.of(context).accentColor,
                                      buttonLables: [
                                        _.paper.quizquestions[_.currentQuestionIndex].a,
                                        _.paper.quizquestions[_.currentQuestionIndex].b,
                                        _.paper.quizquestions[_.currentQuestionIndex].c,
                                        _.paper.quizquestions[_.currentQuestionIndex].d
                                      ],
                                      buttonValues: [
                                        "1",
                                        "2",
                                        "3",
                                        "4"
                                      ],
                                      hight:_.optionHeight,
                                      radioButtonValue:(value){
//                                        print(value);
                                        QuizEnvController.to.answerSelected(value);
//                                        QuizEnvController.to.showQuestionByEvent(2);
                                      },
                                      selectedColor: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                )
                            )
                          ),
                       ),
                      ),
                  ),
                    );
                }
              }
            ),
            bottomNavigationBar:BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              items: <BottomNavigationBarItem>[
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.arrow_back_ios),
                  title: new Text("Previous"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.save),
                  title: new Text("SUBMIT"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.arrow_forward_ios),
                  title: new Text("Next"),
                )
              ],
              onTap:(val){
                    if(val==0||val==2){
                      QuizEnvController.to.showQuestionByEvent(val);
                    }else if(val ==1){
                      QuizEnvController.to.submitQuiz();
                    }
              },
            ) ,
          );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    QuizEnvController g = Get.find();
//    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.paused:
              g.appPauseEvent();
               break;
      case AppLifecycleState.resumed:
        g.appResumeEvent();
        print(g.appPausedCnt);
        if(g.appPausedCnt>=3 || g.totalPauseTime>Duration(seconds: 15))
          Get.offAllNamed('/dashboard');
        break;
      case AppLifecycleState.inactive:
        print('inactive state');
        break;
    }
  }

}