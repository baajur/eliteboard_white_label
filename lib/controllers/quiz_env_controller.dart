import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/models/quiz_answer_model.dart';
import 'package:eliteboard/repositorys/quiz_repo.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:eliteboard/models/quiz_questions_model.dart';
import 'dart:math';
import 'package:eliteboard/utilities/constants.dart';
class QuizEnvController extends GetController {

  QuizAnswer quizAnswer;
  Quiz quiz;
  QuizPaper paper;
  int answer;
  int currentQuestionIndex;
  double optionHeight;
  DateTime alert;
  bool submitExam=false;
  var reached;
  String timeTaken;
  String currentTime="loading";
  int appPausedCnt=0;
  Duration appPausedDuration;
  Duration totalPauseTime;

  static QuizEnvController get to => Get.put<QuizEnvController>(QuizEnvController());

  void answerSelected(String value){
    paper.quizquestions[currentQuestionIndex].userans = value;
    update(this);
    if(currentQuestionIndex!=paper.quizquestions.length-1)
      Future.delayed(const Duration(milliseconds: 500), () {
        showQuestionByEvent(2);
      });
  }

  void getQuizQuestion() async{
    quizAnswer = new QuizAnswer();
    quiz =Get.arguments;
    QuizApi api = new QuizApi();
    final response = await api.quizQuestions(quiz.id);
    if(response!=null){
      paper = response;
      currentQuestionIndex=0;
      optionHeight=findOptionHeight();
      print(paper.quizquestions.length);
    }else{

    }
    update(this);
  }

  void showQuestionByEvent(int value){
    if(value == 0){
        if(currentQuestionIndex!=0)
          currentQuestionIndex-=1;
        else {
          Get.bottomSheet(
            Center(child: Text("No previos question present.",style: TextStyle(
              color: Get.theme.accentColor,
              fontSize: 20
            )),)
          );
        }
      }else if(value == 2){
        if(currentQuestionIndex!=paper.quizquestions.length-1)
          currentQuestionIndex+=1;
        else {
          Get.bottomSheet(
              Center(child: Text("Questions Ended.\n You can submit quiz.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Get.theme.accentColor,
                  fontSize: 20
              )),)
          );
        }
      }
      optionHeight=findOptionHeight();
//      print("he {$optionHeight}");
      update(this);

  }

  double findOptionHeight(){
    double charPerLine = 40;
    double singleLineHeight = 40; // single line height for snigle line option
    double maxLength = singleLineHeight*([paper.quizquestions[currentQuestionIndex].a.toString().trim().length,
      paper.quizquestions[currentQuestionIndex].b.toString().trim().length,
      paper.quizquestions[currentQuestionIndex].c.toString().trim().length,
      paper.quizquestions[currentQuestionIndex].d.toString().trim().length].reduce(max)/charPerLine);
    if(maxLength<charPerLine)
      return singleLineHeight;
    else
      return singleLineHeight*(maxLength.toInt()/charPerLine.toInt());
  }

  Future<bool> isSubmited() async{
    return submitExam;
  }

  void disqualifyUser(){
    print('User disqualified');
  }

  Future<bool> test() async{
    Get.defaultDialog(
        title: 'Unable to quit/go back.',
        content: Text('You can quit by submiting ongoing quiz.',textAlign: TextAlign.center,),
        onCancel: () => print("cancle"),
        buttonColor: Colors.blue,
        confirm: FlatButton(
          onPressed: (){submitExam=true;},
          disabledColor: Colors.red,
          child: Text('Submit'),
          color: successColor,
        ),
        cancel: FlatButton(
          onPressed: ()=>Get.back(),
          disabledColor: Colors.red,
          child: Text('Cancle'),
          color:warningColor,
        ),
        backgroundColor: Get.theme.accentColor
    );
    update(this);
    return false;
  }

  void submitQuiz(){
    Get.defaultDialog(
        title: 'Do you really want to submit? Press Submit to submit.',
        content: Text('On submitting quiz will end and your score will be calculated.',textAlign: TextAlign.center,),
        onCancel: () => print("cancle"),
        buttonColor: Colors.blue,
        confirm: FlatButton(
          onPressed: (){submitExam=true;},
          disabledColor: Colors.red,
          child: Text('Submit'),
          color: successColor,
        ),
        cancel: FlatButton(
          onPressed: ()=>Get.back(),
          disabledColor: Colors.red,
          child: Text('Cancle'),
          color:warningColor,
        ),
      backgroundColor: Get.theme.accentColor
      );
    update(this);
  }

  void quizTimerInit(){
    var now = DateTime.now();
   int quizTotalTimerInSec = int.parse(quiz.paperDuration)*60;
    alert = DateTime.now().add(Duration(seconds: quizTotalTimerInSec));
    reached = now.compareTo(alert) >= 0;
  }

  void updateTimer(){
    var now = DateTime.now();
    if(alert!=null) {
      var remaining = alert.difference(now);
      reached = now.compareTo(alert) >= 0;
      currentTime = formatDuration(remaining);
      Duration total = Duration(seconds: (int.parse(quiz.paperDuration) * 60));
      timeTaken = formatDuration((total - remaining));
      update(this);
    }
  }

  String formatDuration(Duration d) {
    String f(int n) {
      return n.toString().padLeft(2, '0');
    }
    // We want to round up the remaining time to the nearest second
    d += Duration(microseconds: 999999);
    return "${f(d.inMinutes)}:${f(d.inSeconds%60)}";
  }

  void appResumeEvent(){
    var now = DateTime.now();
    Duration remaining = alert.difference(now);
    totalPauseTime = appPausedDuration - remaining;
    if(!Get.isDialogOpen){
      Get.defaultDialog(
          title: '${3-(appPausedCnt+1)} Attempts Remaing!\n Pause Time: ${totalPauseTime.inSeconds}sec.',
          content: Column(
            children: <Widget>[
              Icon(Icons.warning,size: Get.width*0.2,color: Get.theme.errorColor,),
              Text('Disqualification Rules',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold),),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.clear,color: Get.theme.errorColor,)
                    ],
                ),
                title: Text('Try to minimize or switch beetween apps 3 times or more.',textAlign: TextAlign.left,style: TextStyle(
                  fontSize: Get.width*0.035
                ),),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.clear,color: Get.theme.errorColor,),
                title: Text('Keeping app paused/minimizing it for 15 or more seconds. .',textAlign: TextAlign.left,style: TextStyle(
                    fontSize: Get.width*0.035
                ),),
              ),
            ],
          ),
          buttonColor: Colors.blue,
          confirm: FlatButton(
            onPressed: (){Get.back();},
            disabledColor: Colors.red,
            child: Text('Ok'),
            color: successColor,
          ),
          backgroundColor: Get.theme.accentColor
      ).timeout(Duration(seconds: 10),onTimeout:(){
        if(Get.isDialogOpen)
          Get.back();
      });
      appPausedCnt+=1;
    }
    update(this);
  }

  void appPauseEvent(){
    if(Get.isDialogOpen)
      Get.back();
    var now = DateTime.now();
    appPausedDuration = alert.difference(now);
    print(appPausedDuration);
    update(this);
  }
}