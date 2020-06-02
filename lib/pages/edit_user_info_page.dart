import 'package:eliteboard/controllers/edit_user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/widgets/eliteboard_widgets.dart';
class EditUserInfo extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Info'),

      ),
      body:SingleChildScrollView(
        child: GetBuilder<EditUserInfoController>(
          init: EditUserInfoController(),
          initState:(edit){ EditUserInfoController.to.initUserInfoEdit();},
          builder:(edit)=> Container(
            padding: EdgeInsets.only(top: 20.0),
            child: new Theme(
              data: Get.theme.copyWith(primaryColor: Colors.red),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        controller:edit.name,
//                        inputType: TextInputType.text,
                        labelText: 'Name',
//                        initValue: edit.userInfo.studentName,
                        iconData: Icons.person,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        labelText: 'Email',
                        controller:edit.email,
                        iconData: Icons.email,
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        labelText: 'Contact',
                        controller:edit.contact,
                        iconData: Icons.phone_android,
                      )),

                  edit.errorResponse==null?
                  SizedBox.shrink():
                  ErrorList(edit.errorResponse.errors),
                  AccountFormSubmitButton(
                    onPressed: !edit.isLoading?(){
                      EditUserInfoController.to.editUserInfoDetails();
                    }:null,
                    buttonTitle:edit.isLoading?'Loading..':'Update',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}