import 'package:get/get.dart';
import 'package:eliteboard/models/quiz_details_model.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:eliteboard/repositorys/quiz_repo.dart';
class QuizDetailsController extends GetController {

  Quiz quiz;
  QuizDetails quizDetails;
  static QuizDetailsController get to => Get.find();
  void detailsQuiz(){
    quiz = Get.arguments;
    fetchQuizDetails();
    update(this);
  }

  void fetchQuizDetails() async {
    QuizApi api = new QuizApi();
    final response = await api.getQuizDetails(quiz.id);
    if (response != null) {
      quizDetails = response;
      update(this);
    }
  }
}
