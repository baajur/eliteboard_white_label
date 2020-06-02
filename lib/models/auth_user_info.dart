class UserInfo {
  int id;
  String studentName;
  String email;
  String studentContact;
  int studentStatus;
  String createdAt;
  String updatedAt;

  UserInfo(
      {this.id,
        this.studentName,
        this.email,
        this.studentContact,
        this.studentStatus,
        this.createdAt,
        this.updatedAt});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['studentName'];
    email = json['email'];
    studentContact = json['studentContact'];
    studentStatus = json['studentStatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentName'] = this.studentName;
    data['email'] = this.email;
    data['studentContact'] = this.studentContact;
    data['studentStatus'] = this.studentStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}