class QuizDetails {
  String titile;
  String date;
  String time;
  String duration;
  String marks;
  String fees;
  int negative;
  String createdAt;
  int status;
  String note;
  String domain;
  String subdomain;

  QuizDetails(
      {this.titile,
        this.date,
        this.time,
        this.duration,
        this.marks,
        this.fees,
        this.negative,
        this.createdAt,
        this.status,
        this.note,
        this.domain,
        this.subdomain});

  QuizDetails.fromJson(Map<String, dynamic> json) {
    titile = json['titile'];
    date = json['date'];
    time = json['time'];
    duration = json['duration'];
    marks = json['marks'];
    fees = json['fees'];
    negative = json['negative'];
    createdAt = json['createdAt'];
    status = json['status'];
    note = json['note'];
    domain = json['domain'];
    subdomain = json['subdomain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titile'] = this.titile;
    data['date'] = this.date;
    data['time'] = this.time;
    data['duration'] = this.duration;
    data['marks'] = this.marks;
    data['fees'] = this.fees;
    data['negative'] = this.negative;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    data['note'] = this.note;
    data['domain'] = this.domain;
    data['subdomain'] = this.subdomain;
    return data;
  }
}