import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/repositorys/quiz_repo.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
class LiveQuizController extends GetController {

  List<Quiz> items = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);
  LiveQuizResponse liveQuizResponse;
  int page=1;
  static LiveQuizController get to => Get.find();

  void onRefresh() async{
    page=1;
    update(this);
    refreshController.resetNoData();
    QuizApi api = new QuizApi();
    final response = await api.fetchLiveQuizList(page);
    if(response!=null){
     items.clear();
     liveQuizResponse = response;
     page=liveQuizResponse.currentPage+1;
     items.addAll(liveQuizResponse.data);
     refreshController.refreshCompleted();
     update(this);
    }else{
      refreshController.refreshFailed();
    }
    update(this);
  }

  void onLoading() async{
    QuizApi api = new QuizApi();
    final response = await api.fetchLiveQuizList(page);
    if(response!=null){
      liveQuizResponse = response;
      if(liveQuizResponse.data.length>0){
        page=liveQuizResponse.currentPage+1;
        items.addAll(liveQuizResponse.data);
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