import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/models/quiz_answer_model.dart';
import 'package:eliteboard/repositorys/quiz_repo.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:eliteboard/models/quiz_questions_model.dart';
import 'dart:math';
import 'package:eliteboard/utilities/constants.dart';
class QuizResultController extends GetController {
  QuizPaper quizPaper;
  Quiz quiz;
  var timeTaken;
  bool isProcessingResult=true;
  int totalAttempted=0;
  int totalCorrect=0;
  int totalWrong=0;
  double percentScore;
  int totalQues;
  static QuizResultController get to => Get.find();
  void calculateResult(){
    quiz = Get.arguments['quiz'];
    quizPaper = Get.arguments['paper'];
    timeTaken = Get.arguments['timeTaken'];
    totalQues = quizPaper.quizquestions.length;
    processResult();
  }

  void processResult(){
    totalCorrect=0;
    totalWrong=0;
    totalAttempted=0;
    try {
      for (int i = 0; i < quizPaper.quizquestions.length; i++) {
        print('check');
        if (quizPaper.quizquestions[i].userans != null) {
          totalAttempted += 1;
          if (quizPaper.quizquestions[i].userans ==
              quizPaper.quizquestions[i].ans) {
            totalCorrect += 1;
          } else {
            totalWrong += 1;
          }
        }
      }
      print(totalCorrect);
      percentScore = (totalCorrect.toDouble()/10);
//      percentScore=(double.parse(totalCorrect.toString())/double.parse(totalQues.toString()))*100;
      print(percentScore);
      isProcessingResult=false;
      update(this);
    }catch(e){
      print(e.toString()+" Custom ERROR");
    }
  }

  Future<bool> willPopScope() async{
    return false;
  }
}