import 'package:get/get.dart';
import 'package:eliteboard/controllers/main_controller.dart';
import 'package:eliteboard/repositorys/classroom_live_repo.dart';
import 'package:package_info/package_info.dart';
import 'package:eliteboard/models/classroom_live_lecture_list.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ClassroomLiveLectureListController extends GetController {
  static ClassroomLiveLectureListController get to => Get.find();
  List<Lecture> items = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);
  LiveLectureList lectureList;
  int page = 1;

  void onRefresh() async{
    page = 1;
    update(this);
    refreshController.resetNoData();
    ClassroomLiveApi api = new ClassroomLiveApi();
    final response = await api.fetchLiveLectureList(page);
    if(response!=null){
      items.clear();
      lectureList = response;
      page= lectureList.currentPage+1;
      items.addAll(lectureList.data);
      refreshController.refreshCompleted();
      update(this);
    }else{
      refreshController.refreshFailed();
    }
    update(this);
  }

  void onLoading() async{
    ClassroomLiveApi api = new ClassroomLiveApi();
    final response = await api.fetchLiveLectureList(page);
    if(response!=null){
      lectureList = response;
      if(lectureList.data.length>0){
        page= lectureList.currentPage+1;
        items.addAll(lectureList.data);
        refreshController.loadComplete();
      }else{
        refreshController.loadNoData();
      }
    }
    else{
      refreshController.loadNoData();
    }
    update(this);
  }
}