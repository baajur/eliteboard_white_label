import 'package:dio/dio.dart';
import 'package:eliteboard/models/classroom_live_lecture_list.dart';
import 'package:eliteboard/models/classroom_live_lecture_list.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:eliteboard/utilities/apiconstants.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

class ClassroomLiveApi {
  Future<LiveLectureList> fetchLiveLectureList(int page) async {
    print("---- fetching live lecture data-----");
    String accessToken = await getStoredUserToken();
    try {
      //print(accessToken);
      final response = await Dio().get(
        APIURL + 'livelectures?page=$page',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader: 'application/json',
            'Authorization': 'Bearer ' + accessToken
          },
        ),
      );
      print(response.data);
      return LiveLectureList.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}