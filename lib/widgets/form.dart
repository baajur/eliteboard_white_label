import 'package:flutter/material.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
class FormInputField extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextInputType inputType;
  final bool secureText;
  final Widget suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String> validation;
  FormInputField({@required this.validation ,@required this.controller ,@required this.iconData, @required this.hintText,@required this.inputType,this.secureText=false,@required this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: controller,
            autovalidate: false,
            validator: validation,
            keyboardType: inputType,
            obscureText: secureText,
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Theme.of(context).errorColor,
                wordSpacing: 5.0,

              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                iconData,
                color: Get.theme.primaryColor,
              ),
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: kHintTextStyle,

            ),
          ),
        ),
      ],
    );
  }
}

class FormSubmitButton extends StatelessWidget{
  final String buttonTitle;
  final VoidCallback onPressed;
  FormSubmitButton({@required this.buttonTitle, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:onPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Get.theme.accentColor,
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: Get.theme.primaryColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}

class AuthScreenFormBackground extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF6000ff),
            Color(0xFF6100ff),
            Color(0xFF6200ff),
            Color(0xFF6200ee),
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
      ),
    );
  }
}

class FormPageTitle extends StatelessWidget{
  final String title;
  FormPageTitle({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


class AccountFormInputField extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final String hintText;
  final TextInputType inputType;
  final bool secureText;
  final Widget suffixIcon;
  final TextEditingController controller;
  final String initValue;
  final FormFieldValidator<String> validation;
  final double height;
  final List<TextInputFormatter> inputFormatter;
  AccountFormInputField({this.inputFormatter,this.height=80,@required this.initValue,@required this.labelText,@required this.validation ,@required this.controller ,@required this.iconData, @required this.hintText,@required this.inputType,this.secureText=false,@required this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            inputFormatters:inputFormatter,
            controller: controller,
            autovalidate: false,
            validator: validation,
            keyboardType: inputType,
            obscureText: secureText,
            initialValue: initValue,
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              focusColor: Get.theme.primaryColorLight,
              labelText: labelText,
              labelStyle: Get.theme.textTheme.caption.copyWith(color: Get.theme.primaryColor),
              errorStyle: TextStyle(
                color: Theme.of(context).errorColor,
                wordSpacing: 5.0,
              ),
              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                iconData,
                color: Get.theme.primaryColor,
              ),
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class AccountFormSubmitButton extends StatelessWidget{
  final String buttonTitle;
  final VoidCallback onPressed;
  AccountFormSubmitButton({@required this.buttonTitle, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      width: Get.width*0.5,
      child: RaisedButton(
        disabledColor: Get.theme.primaryColorLight,
        elevation: 5.0,
        onPressed:onPressed,
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Get.theme.primaryColor,
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: Get.theme.accentColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
//            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}

class ErrorList extends StatelessWidget{
  final List<String> errors;
  ErrorList(this.errors);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Get.theme.errorColor),
      ),
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: errors.length,
        itemBuilder: (context, index) {
          return Column(
            children:<Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.cancel,color: Get.theme.errorColor,),
                  SizedBox(width: 5.0,),
                  Expanded(child:  Text('${errors[index]}'),),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}