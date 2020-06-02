import 'package:flutter/material.dart';
import 'package:eliteboard/controllers/auth_login_controller.dart';
import  'package:eliteboard/widgets/form.dart';
import 'package:flutter/services.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatelessWidget {

  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  //forgot password button
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => Get.toNamed('/forgotpassword'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }


  Widget _buildSignupBtn(context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/signup"),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: kLabelStyle,
            ),
            TextSpan(
              text: 'Sign Up',
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

  return GetBuilder(
    init: LoginController(),
    builder: (_) => FormInputField(
      validation: passwordValidator,
      controller: _password,
      iconData:Icons.lock,
      hintText: 'Enter yout password',
      inputType: TextInputType.text,
      secureText:_.passwordVisible,
      suffixIcon:IconButton(
        icon: Icon(
          !_.passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,
          color: Theme.of(context).primaryColor,
          size: 20.0,
        ),
        onPressed: () {
          LoginController.to.visibilityOnOff();
        },
      ),
    ),
  );
}

Widget _emailInput(context){

    final  emailValidator = MultiValidator([
    RequiredValidator(errorText: ' Email is required'),
      EmailValidator(errorText: 'enter a valid email address')
  ]);
    return FormInputField(
      validation: emailValidator,
      controller: _email,
      iconData: Icons.email,
      hintText: 'Enter your email',
      inputType: TextInputType.emailAddress,
      suffixIcon: SizedBox.shrink(),
    );
}

  Widget _loginForm(context){
    return Form(
        key: _loginFormKey,
        child: Column(
            children: <Widget>[
              _emailInput(context),
              SizedBox(
                height: 30.0,
              ),
              _passwordInput(context),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FormPageTitle(
                            title:'ELITEBOARD'
                        ),
                        SizedBox(height: 40.0),
                        _loginForm(context),
                        _buildForgotPasswordBtn(),
                        GetBuilder<LoginController>(
                          init: LoginController(),
                          builder:(_)=> FormSubmitButton(
                            onPressed: _.isLoading? null:(){
                              if (_loginFormKey.currentState.validate()) {
                                  LoginController.to.login(_email.text,_password.text).then((value){
                                   // _.isLoggedIn?Get.offAllNamed('/dashboard'):null;
                                    if(_.isLoggedIn)
                                      LoginController.to.fetchUserDetails().then((value){
                                        print(value);
                                        print(_.userInfo);
                                        _.userInfo!=null?Get.offAllNamed('/dashboard'):null;
                                      });
                                  });

                              }
                            },
                            buttonTitle: _.isLoading?'LOADING':'LOGIN',
                          ),
                        ),
                        _buildSignupBtn(context),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}