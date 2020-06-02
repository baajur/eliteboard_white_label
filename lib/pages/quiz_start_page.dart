import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/controllers/quiz_startup_controller.dart';
import 'package:eliteboard/widgets/quiz_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:getflutter/getflutter.dart';



class StartUpQuiz extends StatelessWidget{
@override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Scaffold(
    body: GetBuilder<StartUpQuizController>(
          init: StartUpQuizController(),
          initState:(_){StartUpQuizController.to.startUpQuiz();},
          builder:(_) {
            return SafeArea(
              child: Column(
                children: <Widget>[
                  TopContainer(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.thumb_up,
                          color: Theme
                              .of(context)
                              .primaryColorLight,
                          size: Get.width * 0.2,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                _.quiz.paperTitle,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: Text('Quiz Duration : '+_.quiz.paperDuration,
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),),
                                  ),
//                            HomePage.calendarIcon(),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Number of Questions for Quiz: '+ _.quiz.paperMarks,
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),),
                                  ),
//                            HomePage.calendarIcon(),
                                ],
                              )
                            ],
                          ),)
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Expanded(
//                            child: Text('Title'),),
//                        SizedBox(width: 40),
//                        Expanded(
//                          child: Text('Title'),
//                        ),
//                      ],
//                    ),
//                    Text('Title'),
                            SizedBox(height: 50),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Dos for Quiz',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '1 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '2 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '3 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '4 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Dont\'s for Quiz',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '1 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '2 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '3 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '4 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                                    style: TextStyle(
                                      fontSize: 14,
//                              fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 80),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment
                                        .start,
                                    //direction: Axis.vertical,
                                    alignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    runSpacing: 0,
                                    //textDirection: TextDirection.rtl,
                                    spacing: 10.0,
                                    children: <Widget>[
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            );
          }
       ),
    floatingActionButton: GetBuilder(
      init: StartUpQuizController(),
      builder:(_){
        return FloatingActionButton.extended(
        onPressed: () => Get.toNamed('/quizenv', arguments: _.quiz),
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(Icons.check, color: Colors.lightGreenAccent,),
        label: Text("Start Quiz Now!", style: TextStyle(color: Theme.of(context).accentColor)),
        );
      }
      ),
    );
  }




//       Scaffold(
//            appBar: AppBar(
//              title: Text("Read Information"),
//            ),
//            body:  GetBuilder<StartUpQuizController>(
//                init: StartUpQuizController(),
//                initState:(_){StartUpQuizController.to.startUpQuiz();},
//                builder:(_) {
//                  return Container(
//
//                    margin: EdgeInsets.all(5.0),
//                    child: Card(
////                shape: RoundedRectangleBorder(
////                  borderRadius: BorderRadius.circular(10), // if you need this
////                  side: BorderSide(
////                    color:Theme.of(context).primaryColor,
////                    width: 1,
////                  ),
////                ),
//                      color: Theme
//                          .of(context)
//                          .accentColor,
//                      child: Container(
//                        decoration: BoxDecoration(
//                          gradient: gradient,
//                          shape: BoxShape.rectangle,
//                          borderRadius: BorderRadius.all(
//                              Radius.circular(
//                                  5.0) //                 <--- border radius here
//                          ),
//                        ),
//                        child: Padding(
//                          padding: EdgeInsets.all(10.0),
//                          child: SizedBox(
//                              width: Get.width,
//                              height: Get.height,
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Icon(Icons.assignment,
//                                    color: Theme
//                                        .of(context)
//                                        .accentColor,
//                                    size: Get.width * 0.2,
//                                  ),
//                                  Text(_.quiz.paperTitle,
//                                    textAlign: TextAlign.center,
//                                    style: TextStyle(
//                                      color: Theme
//                                          .of(context)
//                                          .accentColor,
//                                      fontSize: Get.width * 0.08,
//                                    ),
//                                  ),
//                                  drawerDevider,
//                                  Text('Duration: ' + _.quiz.paperDuration +
//                                      " Mins",
//                                    style: TextStyle(
//                                      color: Colors.black54,
//                                      fontSize: Get.width * 0.06,
//                                    ),),
//                                  Text('Questions: ' + _.quiz.paperMarks,
//                                    style: TextStyle(
//                                      color: Colors.black54,
//                                      fontSize: Get.width * 0.06,
//                                    ),
//                                  ),
//                                  drawerDevider,
//                                  FlatButton(
//                                    disabledColor: Theme
//                                        .of(context)
//                                        .highlightColor,
//                                    color: Theme
//                                        .of(context)
//                                        .accentColor,
//                                    child: Text(
//                                      'Start Quiz Now', style: TextStyle(
//                                      color: Theme
//                                          .of(context)
//                                          .primaryColor,
//                                      fontSize: Get.width * 0.06,
//                                    ),
//                                    ),
//                                    onPressed: () =>
//                                        Get.toNamed(
//                                            '/quizenv', arguments: _.quiz),
//                                  )
//                                ],
//                              )),
//                        ),
//                      ),
//                    ),
//
//                  );
//                },
//
//            ),
//          );
      }