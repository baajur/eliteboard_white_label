class LiveQuizResponse {
  int currentPage;
  List<Quiz> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  String prevPageUrl;
  int to;
  int total;

  LiveQuizResponse(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  LiveQuizResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Quiz>();
      json['data'].forEach((v) {
        data.add(new Quiz.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Quiz {
  int id;
  String paperTitle;
  String paperDate;
  String paperTime;
  String paperDuration;
  String paperMarks;
  String paperFee;
  bool negativeMarkFlag;
  String domainName;
  String examSubDomainName;

  Quiz(
      {this.id,
        this.paperTitle,
        this.paperDate,
        this.paperTime,
        this.paperDuration,
        this.paperMarks,
        this.paperFee,
        this.negativeMarkFlag,
        this.domainName,
        this.examSubDomainName});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paperTitle = json['paperTitle'];
    paperDate = json['paperDate'];
    paperTime = json['paperTime'];
    paperDuration = json['paperDuration'];
    paperMarks = json['paperMarks'];
    paperFee = json['paperFee'];
    negativeMarkFlag = json['negativeMarkFlag'];
    domainName = json['domainName'];
    examSubDomainName = json['examSubDomainName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paperTitle'] = this.paperTitle;
    data['paperDate'] = this.paperDate;
    data['paperTime'] = this.paperTime;
    data['paperDuration'] = this.paperDuration;
    data['paperMarks'] = this.paperMarks;
    data['paperFee'] = this.paperFee;
    data['negativeMarkFlag'] = this.negativeMarkFlag;
    data['domainName'] = this.domainName;
    data['examSubDomainName'] = this.examSubDomainName;
    return data;
  }
}