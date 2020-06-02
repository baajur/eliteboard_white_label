import 'package:eliteboard/repositorys/user_repo.dart';
import 'package:get/get.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eliteboard/models/auth_user_bank_info.dart';
import 'package:eliteboard/models/auth_user_info.dart';
import 'package:eliteboard/models/auth_user_contact_info.dart';

class AccountDetailsController extends GetController {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static AccountDetailsController get to => Get.find();
  UserInfo userInfo;
  UserContactInfo userContactInfo;
  UserBankDetails userBankDetails;

  void fecthUserInfo() async{
    final SharedPreferences prefs = await _prefs;
    if(userInfo==null)
    {
      AuthApi api = new AuthApi();
      final response = await api.userInfo();
      if(response!=null)
      {
        userInfo = response;
        prefs.setString('userName',userInfo.studentName);
        prefs.setString('userEmail',userInfo.email);
      }
      update(this);
    }
  }

  void fecthUserContactInfo() async{
    if(userContactInfo==null)
    {
      AuthApi api = new AuthApi();
      final response = await api.userContactInfo();
      if(response!=null){
        userContactInfo = response;
      }
      update(this);
    }
  }

  void fecthUserBankInfo() async{
    if(userBankDetails==null)
    {
      AuthApi api = new AuthApi();
      final response = await api.userBankInfo();
      if(response!=null){
        userBankDetails = response;
      }
      update(this);
    }
  }

  void edit() async{
    var data = await Get.toNamed('/edituserinfo',arguments:userInfo);
    print(data);
    if(data=='success'){
      print(data);
      userInfo=null;
      update(this);
      fecthUserInfo();
    }
  }

  void editContactDetails() async {
    var data = await Get.toNamed('/editusercontact',arguments:userContactInfo);
    print(data);
    if(data=='success'){
      print(data);
      userContactInfo=null;
      fecthUserContactInfo();
      update(this);
    }
  }

  void editBankDetails() async{
    var data = await Get.toNamed('/edituserbank',arguments:userBankDetails);
    print(data);
    if(data=='success'){
      print(data);
      userBankDetails=null;
      fecthUserBankInfo();
      update(this);
    }
  }
}