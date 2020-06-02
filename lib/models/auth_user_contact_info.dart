class UserContactInfo {
  int sid;
  int state;
  String stateName;
  String cityName;
  int city;
  String address;
  String pinCode;
  String collegeName;
  String collegePinCode;
  String alternateContact;
  String lastUpdate;

  UserContactInfo(
      {this.sid,
        this.state,
        this.stateName,
        this.cityName,
        this.city,
        this.address,
        this.pinCode,
        this.collegeName,
        this.collegePinCode,
        this.alternateContact,
        this.lastUpdate});

  UserContactInfo.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    state = json['state'];
    stateName = json['stateName'];
    cityName = json['cityName'];
    city = json['city'];
    address = json['address'];
    pinCode = json['pinCode'];
    collegeName = json['collegeName'];
    collegePinCode = json['collegePinCode'];
    alternateContact = json['alternateContact'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    data['state'] = this.state;
    data['stateName'] = this.stateName;
    data['cityName'] = this.cityName;
    data['city'] = this.city;
    data['address'] = this.address;
    data['pinCode'] = this.pinCode;
    data['collegeName'] = this.collegeName;
    data['collegePinCode'] = this.collegePinCode;
    data['alternateContact'] = this.alternateContact;
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}