import 'package:eliteboard/controllers/quiz_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eliteboard/widgets/quiz_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/utilities/constants.dart';

class OngoingQuizs extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Now'),
      ),
      body:  GetBuilder<LiveQuizController>(
        init: LiveQuizController(),
        initState:(quizlist){LiveQuizController.to.onLoading();},
        builder:(quizlist)=> SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context,LoadStatus mode){
              Widget body ;
             // print(quizlist.liveQuizResponse);
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
          controller: quizlist.refreshController,
          onRefresh: quizlist.onRefresh,
          onLoading: quizlist.onLoading,
          child:_buildChild(quizlist),
        ),
      ),
    );
  }

  Widget _buildChild(quizlist) {
    if (quizlist.liveQuizResponse==null) {
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
        return SingleOngoingQuizCard(quizlist.items[i]);
      },
    //          itemExtent: 230,
        itemCount: quizlist.items.length,
    );
  }
}