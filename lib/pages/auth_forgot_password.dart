import 'package:flutter/material.dart';
import 'package:eliteboard/controllers/auth_login_controller.dart';
import  'package:eliteboard/widgets/form.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgotPassword extends StatelessWidget {

  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();

  Widget _emailInput(context){
    final  emailValidator = MultiValidator([
      RequiredValidator(errorText: ' Email is required'),
      EmailValidator(errorText: 'enter a valid email address')
    ]);
    return    FormInputField(
      controller: _email,
      validation: emailValidator,
      iconData: Icons.email,
      hintText: 'Registerd email',
      inputType: TextInputType.emailAddress,
      suffixIcon: SizedBox.shrink(),
    );
  }

  Widget _forgotPasswordForm(context){
    return Form(
        key: _loginFormKey,
        child: Column(
            children: <Widget>[
              _emailInput(context),
              SizedBox(
                height: 30.0,
              ),
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
                      _forgotPasswordForm(context),
                      FormSubmitButton(
                        onPressed: (){
                          if (_loginFormKey.currentState.validate()) {

                          }
                        },
                        buttonTitle: 'RESET PASSWORD',
                      ),
                    ],
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