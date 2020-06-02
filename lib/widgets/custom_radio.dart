import 'package:flutter/material.dart';
import 'dart:math';
class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    this.currentSelected,
    this.buttonLables,
    this.buttonValues,
    this.radioButtonValue,
    this.buttonColor,
    this.selectedColor,
    this.hight = 35,
    this.width = 100,
    this.horizontal = false,
    this.enableShape = false,
    this.elevation = 10,
    this.customShape,
  })  : assert(buttonLables.length == buttonValues.length),
        assert(buttonColor != null),
        assert(selectedColor != null);

  final bool horizontal;
  int currentSelected;

  final List buttonValues;

  final double hight;
  final double width;

  final List<String> buttonLables;

  final Function(dynamic) radioButtonValue;

  final Color selectedColor;

  final Color buttonColor;
  final ShapeBorder customShape;
  final bool enableShape;
  final double elevation;

  @override
  Widget build(BuildContext context) {


   return Container(
      height: horizontal
          ? hight * (buttonLables.length + 0.5)
          : null,
      child: Center(
        child: horizontal
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: buildButtonsColumn(context),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[],
        ),
      ),
    );
  }
  List<Widget> buildButtonsColumn(context) {
    List<Widget> buttons = [];
    for (int index = 0; index < buttonLables.length; index++) {
      var button = Expanded(
        // flex: 1,
        child: Card(
          color: currentSelected==null?buttonColor : buttonLables[currentSelected] == buttonLables[index]
              ? selectedColor
              : buttonColor,
          elevation: elevation,
          shape: enableShape
              ? customShape == null
              ? RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          )
              : customShape
              : null,
          child: Container(
            height: hight,
            child: MaterialButton(
              shape: enableShape
                  ? customShape == null
                  ? OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme
                        .of(context)
                        .primaryColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )
                  : customShape
                  : OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme
                        .of(context)
                        .primaryColor, width: 1),
                borderRadius: BorderRadius.zero,
              ),
              onPressed:(){

                radioButtonValue(buttonValues[index]);
                currentSelected = index;
                if(currentSelected!=null){
                  buttonLables[currentSelected] = buttonLables[index];
                }
              },
              child: Text(
                buttonLables[index],
                style: TextStyle(
                  color: currentSelected==null?Theme
                      .of(context)
                      .textTheme
                      .body1
                      .color:buttonLables[currentSelected] == buttonLables[index]
                      ? Colors.white
                      : Theme
                      .of(context)
                      .textTheme
                      .body1
                      .color,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      );
      buttons.add(button);
    }
    return buttons;
  }
//  List<Widget> buildButtonsRow(context) {
//    List<Widget> buttons = [];
//    for (int index = 0; index < buttonLables.length; index++) {
//      var button = Expanded(
//        // flex: 1,
//        child: Card(
//          color: currentSelectedLabel == buttonLables[index]
//              ? selectedColor
//              : buttonColor,
//          elevation: elevation,
//          shape: enableShape
//              ? customShape == null
//              ? RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(50)),
//          )
//              : customShape
//              : null,
//          child: Container(
//            height: hight,
//            // width: 200,
//            constraints: BoxConstraints(maxWidth: 250),
//            child: MaterialButton(
//              shape: enableShape
//                  ? customShape == null
//                  ? OutlineInputBorder(
//                borderSide: BorderSide(
//                    color: Theme
//                        .of(context)
//                        .primaryColor, width: 1),
//                borderRadius: BorderRadius.all(Radius.circular(20)),
//              )
//                  : customShape
//                  : OutlineInputBorder(
//                borderSide: BorderSide(
//                    color: Theme
//                        .of(context)
//                        .primaryColor, width: 1),
//                borderRadius: BorderRadius.zero,
//              ),
//              onPressed: () {
//                radioButtonValue(buttonValues[index]);
//                setState(() {
//                  currentSelected = index;
//                  currentSelectedLabel = buttonLables[index];
//                });
//              },
//              child: Text(
//                buttonLables[index],
//                style: TextStyle(
//                  color: currentSelectedLabel == buttonLables[index]
//                      ? Colors.white
//                      : Theme
//                      .of(context)
//                      .textTheme
//                      .body1
//                      .color,
//                  fontSize: 15,
//                ),
//              ),
//            ),
//          ),
//        ),
//      );
//      buttons.add(button);
//    }
//    return buttons;
//  }
}