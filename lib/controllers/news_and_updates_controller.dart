import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/repositorys/quiz_repo.dart';
import 'package:eliteboard/models/news_and_updates_model.dart';

class NewsUpdatesController extends GetController {

  List<News> items = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);

  NewsAndUpdatesResponse newsAndUpdatesResponse;

  int page = 1;
  static NewsUpdatesController get to => Get.find();

  void onRefresh() async{
    page = 1;
    update(this);
    refreshController.resetNoData();
    QuizApi api = new QuizApi();
    final response = await api.getNewsUpdatesList(page);
    if(response!=null){
      items.clear();
      newsAndUpdatesResponse = response;
      page= newsAndUpdatesResponse.currentPage+1;
      items.addAll(newsAndUpdatesResponse.data);
      refreshController.refreshCompleted();
      update(this);
    }else{
      refreshController.refreshFailed();
    }
    update(this);
  }

  void onLoading() async{
    QuizApi api = new QuizApi();
    final response = await api.getNewsUpdatesList(page);
    if(response!=null){
      newsAndUpdatesResponse = response;
      if(newsAndUpdatesResponse.data.length>0){
        page= newsAndUpdatesResponse.currentPage+1;
        items.addAll(newsAndUpdatesResponse.data);
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