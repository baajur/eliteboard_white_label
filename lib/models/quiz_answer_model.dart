class QuizAnswer {
  List<Answers> answers;

  QuizAnswer({this.answers});

  QuizAnswer.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = new List<Answers>();
      json['answers'].forEach((v) {
        answers.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int questionId;
  String ans;

  Answers({this.questionId, this.ans});

  Answers.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    ans = json['ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['ans'] = this.ans;
    return data;
  }
}