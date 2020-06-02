import 'package:flutter/material.dart';
import 'package:eliteboard/controllers/auth_signup_controller.dart';
import  'package:eliteboard/widgets/form.dart';
import 'package:flutter/services.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:dio/dio.dart';
class SignUp extends StatelessWidget {

  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _mobile = new TextEditingController();

  Widget _paddingBetweenInputs(){
    return  SizedBox(
      height: 20.0,
    );
  }

  Widget _buildSignupBtn(context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: kLabelStyle,
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }



  //password Input field
  Widget _passwordInput(context){

    final  passwordValidator = MultiValidator([
      RequiredValidator(errorText: ' Password is required'),
      MinLengthValidator(8, errorText: ' Password must be at least 8 digits long'),
//    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: ' Passwords must have at least one special character')
    ]);

    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (_) => FormInputField(
        controller: _password,
        validation: passwordValidator,
        iconData:Icons.lock,
        hintText: 'Enter yout password',
        inputType: TextInputType.text,
        secureText:_.passwordVisible,
        suffixIcon:IconButton(
          icon: Icon(
            !_.passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Theme.of(context).accentColor,
            size: 20.0,
          ),
          onPressed: () {
            SignUpController.to.visibilityOnOff();
          },
        ),
      ),
    );
  }

  // input field for name
  Widget _nameInput(context){
    final  nameValdidation = MultiValidator([
      RequiredValidator(errorText: ' Name is required'),
    ]);
    return    FormInputField(
      validation: nameValdidation,
      controller: _name,
      iconData: Icons.account_box,
      hintText: 'Enter your full name',
      inputType: TextInputType.text,
      suffixIcon: SizedBox.shrink(),
    );
  }

  Widget _contactInput(context){

    final  mobileValidation = MultiValidator([
      RequiredValidator(errorText: ' Mobile number is required'),
    ]);
    return    FormInputField(
      validation: mobileValidation,
      controller: _mobile,
      iconData: Icons.phone_android,
      hintText: 'Enter your mobile',
      inputType: TextInputType.number,
      suffixIcon: SizedBox.shrink(),
    );
  }

  //input field for email
  Widget _emailInput(context){
    final  emailValidation = MultiValidator([
      RequiredValidator(errorText: ' Email is required'),
    ]);

    return    FormInputField(
      validation: emailValidation,
      controller: _email,
      iconData: Icons.email,
      hintText: 'Enter your email',
      inputType: TextInputType.emailAddress,
      suffixIcon: SizedBox.shrink(),
    );
  }

  //Remember me chekbox button
  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: GetBuilder<SignUpController>(
              builder: (_) => Checkbox(
                  value: _.termsAccepted,
                  checkColor: Colors.green,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    SignUpController.to.toggleTermsConditions();
                  }),
            ),
          ),
          Text(
            'I agree to terms & conditions',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _signUpForm(context){
    return Form(
        key: _loginFormKey,
        child: Column(
            children: <Widget>[
              _nameInput(context),
              _paddingBetweenInputs(),
              _emailInput(context),
              _paddingBetweenInputs(),
              _passwordInput(context),
              _paddingBetweenInputs(),
              _contactInput(context),
              _paddingBetweenInputs(),
              _buildRememberMeCheckbox()
            ]
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              AuthScreenFormBackground(),
              Container(
                height: double.infinity,
                child: Center(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 80.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FormPageTitle(
                            title:'ELITEBOARD'
                        ),
                        SizedBox(height: 40.0),
                        _signUpForm(context),
                        GetBuilder<SignUpController>(
                          builder:(sup){
                            return FormSubmitButton(
                            onPressed:!sup.isLoading?(){
                              if (_loginFormKey.currentState.validate()){
                                FormData formData = new FormData.fromMap({
                                  "name":_name.text,
                                  "email":_email.text,
                                  "password":_password.text,
                                  "studentContact":_mobile.text
                                });
                                SignUpController.to.signUpUser(formData).then((value){
                                  if(sup.isRegistered)
                                    Get.toNamed('/login');
                                });
                              }
                            }:null,
                            buttonTitle: !sup.isLoading?'REGISTER':'LOADING',
                          );
                          }
                        ),
                        _buildSignupBtn(context),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}