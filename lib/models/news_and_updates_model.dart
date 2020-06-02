class NewsAndUpdatesResponse {

  int currentPage;
  List<News> data;
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

  NewsAndUpdatesResponse(
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

  NewsAndUpdatesResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<News>();
      json['data'].forEach((v) {
        data.add(new News.fromJson(v));
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

class News {
  int id;
  String newsHeading;
  String newsDescription;
  String paperTime;
  String newsValidTill;
  String created_at;

  News(
      {this.id,
        this.newsHeading,
        this.newsDescription,
        this.newsValidTill,
        this.created_at});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsHeading = json['newsHeading'];
    newsDescription = json['newsDescription'];
    newsValidTill = json['newsValidTill'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['newsHeading'] = this.newsHeading;
    data['newsDescription'] = this.newsDescription;
    data['newsValidTill'] = this.newsValidTill;
    data['created_at'] = this.created_at;
    return data;
  }
}