import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/repositorys/user_repo.dart';
import 'package:eliteboard/models/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eliteboard/models/auth_user_info.dart';

class LoginController extends GetController {
  static LoginController get to => Get.find();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool passwordVisible  = true;
  bool isLoading = false;
  bool isLoggedIn=false;
  String loadingMesg = "Loading..";
  Auth data;
  UserInfo userInfo;
  void visibilityOnOff() {
    if(passwordVisible)
      passwordVisible=false;
    else
      passwordVisible=true;
    update(this);
  }

  Future login(String email,String password) async{
    final SharedPreferences prefs = await _prefs;
    isLoading =true;
    update(this);
    AuthApi api = AuthApi();
    final response = await api.fetchData(email,password);
    if (response == null) {
      Get.bottomSheet(
          Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.error),
                    title: Text('The user credentials were incorrect'),
                    onTap: () => {}
                ),
              ],
            ),
          )
      );
    } else {
      data = response;
      isLoggedIn = true;
      prefs.setString('accessToken',data.accessToken);

    }
    isLoading =false  ;
    update(this);
  }

  Future fetchUserDetails() async{
    final SharedPreferences prefs = await _prefs;
    isLoading = true;
    update(this);
    AuthApi api = AuthApi();
    final userInfoRes = await api.userInfo();
      if(userInfoRes!=null){
        userInfo=userInfoRes;
        prefs.setString('userName',userInfo.studentName);
        prefs.setString('userEmail',userInfo.email);
      }
      print(userInfo);
    isLoading = false;
    update(this);
  }

}