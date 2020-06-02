import 'package:eliteboard/controllers/edit_user_bank_controller.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/widgets/eliteboard_widgets.dart';
import 'package:flutter/services.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';
class EditUserBankInfo extends StatelessWidget{

  //validations start
  final _editBankFormKey = GlobalKey<FormState>();
  final  accountNumberValidation = MultiValidator([
    RequiredValidator(errorText: ' Account number is required'),
  ]);
  final  accountHoldNameValidation = MultiValidator([
    RequiredValidator(errorText: ' Account holder name is required'),
  ]);
  final  bankNameValidation = MultiValidator([
    RequiredValidator(errorText: ' Bank name is required'),
  ]);
  final  bankIFSCValidation = MultiValidator([
    RequiredValidator(errorText: ' Bank IFSC is required'),
  ]);
  final  bankAddressValidation = MultiValidator([
    RequiredValidator(errorText: ' Bank IFSC is required'),
  ]);//validations end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Edit Bank Details'),
      ),
      body: SingleChildScrollView(
        child:GetBuilder<EditUserBankController>(
          init: EditUserBankController(),
          initState: (bank){
            EditUserBankController.to.initUserBankEdit();
          },
          builder: (bank){
            return Form(
              key: _editBankFormKey,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        validation: accountHoldNameValidation,
                        controller:bank.accountHolder,
                          inputType: TextInputType.text,
                        labelText: 'Account Holder Name',
                        iconData: Icons.person,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        validation: accountNumberValidation,
                        controller:bank.accountNumber,
                        inputType: TextInputType.text,
                        labelText: 'Account Number',
                        iconData: Icons.edit,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        validation: bankNameValidation,
                        controller: bank.bankName,
                        inputType: TextInputType.text,
                        labelText: 'Bank Name',
                        iconData: Icons.account_balance,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        validation: bankIFSCValidation,
                        controller:bank.bankIFSC,
                        inputType: TextInputType.text,
                        labelText: 'Bank IFSC Code',
                        iconData: Icons.edit,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AccountFormInputField(
                        validation: bankAddressValidation,
                        controller:bank.bankAddress,
                        inputType: TextInputType.text,
                        labelText: 'Bank Address',
                        iconData: Icons.location_on,
                      )
                  ),
                  bank.errorResponse==null?
                  SizedBox.shrink():
                  ErrorList(bank.errorResponse.errors),
                  AccountFormSubmitButton(
                    onPressed: !bank.isLoading?(){
                      if (_editBankFormKey.currentState.validate()){
                        EditUserBankController.to.editUserBankDetails();
                      }
                    }:null,
                    buttonTitle:bank.isLoading?'Loading..':'Update',
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}