class QuizPaper {
  bool status;
  List<Quizquestions> quizquestions;

  QuizPaper({this.status, this.quizquestions});

  QuizPaper.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['quizquestions'] != null) {
      quizquestions = new List<Quizquestions>();
      json['quizquestions'].forEach((v) {
        quizquestions.add(new Quizquestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.quizquestions != null) {
      data['quizquestions'] =
          this.quizquestions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quizquestions {
  int id;
  int quizId;
  int domain;
  int subdomain;
  String question;
  String a;
  String b;
  String c;
  String d;
  String ans;
  String userans=null;
  int type;
  String createdAt;
  String updatedAt;

  Quizquestions(
      {this.id,
        this.quizId,
        this.domain,
        this.subdomain,
        this.question,
        this.a,
        this.b,
        this.c,
        this.d,
        this.ans,
        this.type,
        this.createdAt,
        this.updatedAt});

  Quizquestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizId = json['quiz_id'];
    domain = json['domain'];
    subdomain = json['subdomain'];
    question = json['question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    ans = json['ans'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quiz_id'] = this.quizId;
    data['domain'] = this.domain;
    data['subdomain'] = this.subdomain;
    data['question'] = this.question;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['ans'] = this.ans;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}