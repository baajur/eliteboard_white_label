class QuizApplyResponse {
  bool status;
  String data;
  Application application;

  QuizApplyResponse({this.status, this.data, this.application});

  QuizApplyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    application = json['application'] != null
        ? new Application.fromJson(json['application'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    if (this.application != null) {
      data['application'] = this.application.toJson();
    }
    return data;
  }
}

class Application {
  int studentId;
  String quizId;
  String updatedAt;
  String createdAt;
  int id;

  Application(
      {this.studentId, this.quizId, this.updatedAt, this.createdAt, this.id});

  Application.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    quizId = json['quizId'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['quizId'] = this.quizId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}