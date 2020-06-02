import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/models/auth_signup_errors.dart';
import 'package:eliteboard/models/common_response.dart';
import 'package:eliteboard/repositorys/user_repo.dart';

class SignUpController extends GetController {

  bool passwordVisible  = true;
  bool termsAccepted = true;
  bool isRegistered =false;
  SignUpError error;
  bool isLoading=false;
  static SignUpController get to => Get.find();

  void visibilityOnOff() {
    if(passwordVisible)
      passwordVisible=false;
    else
      passwordVisible=true;
    update(this);
  }

  void toggleTermsConditions(){
    if(termsAccepted)
      termsAccepted=false;
    else
      termsAccepted=true;
    update(this);
  }

  Future<dynamic> signUpUser(FormData fD) async {
    isLoading = true;
    update(this);
    AuthApi api = AuthApi();
    final response = await api.signUp(fD);
    if(response is SignUpError){
      error =response;
      Get.bottomSheet(
          Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.error),
                    title:Text('Email address or contact number is already taken.'),
                    onTap:null
                ),
              ],
            ),
          )
      );
    }else if(response is CommonResponse){
        isRegistered = true;
        Get.snackbar('Successful registartion','Please login to your account.');
    }
    isLoading = false;
    update(this);
  }
}