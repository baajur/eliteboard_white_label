import 'package:eliteboard/controllers/classroom_live_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:eliteboard/widgets/live_lecture_widgets.dart';

class ClassroomLiveLectureList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Lectures'),
      ),
      body: GetBuilder(
        init: ClassroomLiveLectureListController(),
        initState: (_){ClassroomLiveLectureListController.to.onLoading();},
        builder: (_){
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context,LoadStatus mode){
                Widget body ;
                if(mode==LoadStatus.idle){
                  body =  Text("pull up load",style:quizCardTextStyle,);
                }
                else if(mode==LoadStatus.loading){
                  body =  CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  );
                }
                else if(mode == LoadStatus.failed){
                  body = Text("Load Failed!Click retry!",style:quizCardTextStyle,);
                }
                else if(mode == LoadStatus.canLoading){
                  body = Text("release to load more",style:quizCardTextStyle,);
                }
                else{
                  body = Text("No more Data",style:quizCardTextStyle,);
                }
                return Container(
                  height: 55.0,
                  child: Center(child:body),
                );
              },
            ),
            controller: _.refreshController,
            onRefresh: _.onRefresh,
            onLoading: _.onLoading,
            child: _buildChild(_),
          );
        },
      ),
    );
  }

  Widget _buildChild(_) {
    if (_.lectureList == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator (
            backgroundColor: Get.theme.primaryColor,
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (c, i){
        return LiveLectureListCard(lecture: _.items[i],onTap:(){
          Get.toNamed('/liveclass',arguments:_.items[i]);
        },);
      },
      //          itemExtent: 230,
      itemCount: _.items.length,
    );
  }
}