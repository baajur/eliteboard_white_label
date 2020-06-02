import 'package:dio/dio.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:eliteboard/models/quiz_details_model.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:eliteboard/utilities/apiconstants.dart';
import 'package:eliteboard/models/quiz_apply_response.dart';
import 'package:eliteboard/models/quiz_questions_model.dart';
import 'package:eliteboard/models/news_and_updates_model.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

class QuizApi{
  Future<LiveQuizResponse> fetchLiveQuizList(int page) async {
   String accessToken =  await getStoredUserToken();
    try {
      //print(accessToken);
      final response = await Dio().get(
        APIURL+'quiz?page=$page',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print(response.data);
      return LiveQuizResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString()+" custom");
      return null;
    }
  }

  Future<QuizApplyResponse> applyForQuiz(int quizId) async {
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().post(
        APIURL+'applyforquiz',
        data:{"quizId":quizId},
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print(response.data);
      return QuizApplyResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString()+" custom");
      return null;
    }
  }

  Future<QuizPaper> quizQuestions(int quizId) async {
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().post(
        APIURL+'quizquestions',
        data:{"quizId":quizId},
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print(response.data);
      return QuizPaper.fromJson(response.data);
    } catch (e) {
      print(e.toString()+" custom");
      return null;
    }
  }

  Future<QuizDetails> getQuizDetails(int quizId) async {
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().get(
        APIURL+'quiz/$quizId',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print(response.data);
      return QuizDetails.fromJson(response.data);
    } catch (e) {
      print(e.toString()+" custom");
      return null;
    }
  }

  Future<NewsAndUpdatesResponse> getNewsUpdatesList(int page) async {
    String accessToken =  await getStoredUserToken();
    try {
      //print(accessToken);
      final response = await Dio().get(
        APIURL+'newsUpdates?page=$page',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print(response.data);
      return NewsAndUpdatesResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString()+" custom");
      return null;
    }
  }

}