import 'package:eliteboard/repositorys/user_repo.dart';
import 'package:get/get.dart';
import 'package:eliteboard/models/auth_user_info.dart';
import 'package:flutter/material.dart';
import 'package:eliteboard/models/error_response.dart';
class EditUserInfoController extends GetController {
  UserInfo userInfo;
  ErrorResponse errorResponse;
  bool isLoading = false;
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController contact = new TextEditingController();

  static EditUserInfoController get to => Get.find();

  void initUserInfoEdit(){
    userInfo=Get.arguments;
    name.text = userInfo.studentName;
    email.text = userInfo.email;
    contact.text = userInfo.studentContact;
  }

  void editUserInfoDetails() async{
    isLoading = true;
    update(this);
    UserInfo ui = new UserInfo(
      studentName:name.text,
      studentContact: contact.text,
      email:email.text
    );
    AuthApi api = new AuthApi();
    final response = await api.editUserInfo(ui);
    if(response is UserInfo){
      Get.back(result: 'success');
    }
    else if(response is ErrorResponse){
      errorResponse = response;
    }
    isLoading = false;
    update(this);
  }
}