import 'package:eliteboard/models/auth_user_bank_info.dart';
import 'package:eliteboard/repositorys/user_repo.dart';
import 'package:eliteboard/models/city_model.dart';
import 'package:eliteboard/models/state_model.dart';
import 'package:get/get.dart';
import 'package:eliteboard/models/auth_user_contact_info.dart';
import 'package:flutter/material.dart';
import 'package:eliteboard/models/error_response.dart';
import 'package:eliteboard/repositorys/masters.dart';

class EditUserBankController extends GetController {
  bool isLoading= false;
  UserBankDetails userBankDetails;
  ErrorResponse errorResponse;
  static EditUserBankController get to => Get.find();

  TextEditingController accountHolder = new TextEditingController();
  TextEditingController accountNumber = new TextEditingController();
  TextEditingController bankName = new TextEditingController();
  TextEditingController bankIFSC = new TextEditingController();
  TextEditingController bankAddress = new TextEditingController();

  void initUserBankEdit(){
    userBankDetails = Get.arguments;
    accountHolder.text = userBankDetails.accountHolderName;
    accountNumber.text = userBankDetails.accountNumber;
    bankName.text = userBankDetails.name;
    bankIFSC.text = userBankDetails.ifsc;
    bankAddress.text = userBankDetails.address;
  }

  void editUserBankDetails() async{
    isLoading = true;
    update(this);
    UserBankDetails ubi = new UserBankDetails(
      address: bankAddress.text,
      name: bankName.text,
      accountHolderName: accountHolder.text,
      accountNumber: accountNumber.text,
      ifsc: bankIFSC.text,
    );
    AuthApi api = new AuthApi();
    final response = await api.editUserBankInfo(ubi);
    if(response is UserBankDetails){
      Get.back(result: 'success');
    }
    else if(response is ErrorResponse){
      errorResponse = response;
    }
    isLoading = false;
    update(this);
  }
}