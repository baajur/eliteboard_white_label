import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/repositorys/quiz_repo.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
class StartUpQuizController extends GetController {

  Quiz quiz;
  static StartUpQuizController get to => Get.find();
  void startUpQuiz(){
    quiz = Get.arguments;
    update(this);
  }

}