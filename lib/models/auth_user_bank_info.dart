class UserBankDetails{
  String accountHolderName;
  String accountNumber;
  String name;
  String ifsc;
  String address;
  int verified;
  String lastUpdate;

  UserBankDetails(
      {this.accountHolderName,
        this.accountNumber,
        this.name,
        this.ifsc,
        this.address,
        this.verified,
        this.lastUpdate});

  UserBankDetails.fromJson(Map<String, dynamic> json) {
    accountHolderName = json['accountHolderName'];
    accountNumber = json['accountNumber'];
    name = json['name'];
    ifsc = json['ifsc'];
    address = json['address'];
    verified = json['verified'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountHolderName'] = this.accountHolderName;
    data['accountNumber'] = this.accountNumber;
    data['name'] = this.name;
    data['ifsc'] = this.ifsc;
    data['address'] = this.address;
    data['verified'] = this.verified;
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}