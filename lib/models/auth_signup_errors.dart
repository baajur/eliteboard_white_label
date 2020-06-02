class SignUpError {
  String message;
  Errors errors;

  SignUpError({this.message, this.errors});

  SignUpError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors.toJson();
    }
    return data;
  }
}

class Errors {
  List<String> studentContact;
  List<String> email;

  Errors({this.studentContact, this.email});

  Errors.fromJson(Map<String, dynamic> json) {
    if(json['studentContact']!=null)
    studentContact = json['studentContact'].cast<String>();
    if(json['email']!=null)
    email = json['email'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentContact'] = this.studentContact;
    data['email'] = this.email;
    return data;
  }
}