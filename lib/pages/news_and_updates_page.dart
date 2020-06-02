import 'package:flutter/material.dart';
import 'package:eliteboard/controllers/news_and_updates_controller.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:get/get.dart';

import 'package:eliteboard/widgets/quiz_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsAndUpdates extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News & Updates"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.teal[50]),
        child: GetBuilder<NewsUpdatesController>(
          init: NewsUpdatesController(),
          initState:(newslist){NewsUpdatesController.to.onLoading();},
          builder:(newslist)=> SmartRefresher(
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
            controller: newslist.refreshController,
            onRefresh: newslist.onRefresh,
            onLoading: newslist.onLoading,
            child: _buildChild(newslist),
          ),
        ),
      ));
  }

  Widget _buildChild(newslist) {
    if (newslist.newsAndUpdatesResponse == null) {
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
        return NewsAndDetailsCard(newslist.items[i]);
      },
      //          itemExtent: 230,
      itemCount: newslist.items.length,
    );
  }
}