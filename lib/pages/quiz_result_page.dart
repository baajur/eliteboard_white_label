import 'package:eliteboard/controllers/quiz_result_controller.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/widgets/quiz_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'dart:convert';
import 'package:eliteboard/widgets/custom_radio.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'dart:async';
import 'package:eliteboard/widgets/quiz_widgets.dart';

class QuizResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
        leading: Icon(Icons.grade),
      ),
      body: GetBuilder<QuizResultController>(
        init: QuizResultController(),
        initState:(result){QuizResultController.to.calculateResult();},
        builder: (result){
          if(result.isProcessingResult) {
            return Container(child: Center(child: CircularProgressIndicator (backgroundColor: Get.theme.primaryColor,)));
          } else
          return WillPopScope(
            onWillPop: QuizResultController.to.willPopScope,
            child: Container (
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
//                  FlatButton(
//                    child: Text('asd'),
//                    onPressed: (){
//                      QuizResultController.to.processResult();
//
//                    },
//                    color: Get.theme.primaryColor,
//                  ),
                    QuizResultCard(
                      cardColor: Get.theme.primaryColor,
                      loadingPercent: result.percentScore,
                      quiz: result.quiz,
                      attemptCnt: result.totalAttempted,
                      correctCnt: result.totalCorrect,
                      wrongCnt: result.totalWrong,
                      totalQes:result.totalQues,
                        timeTaken:result.timeTaken
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}