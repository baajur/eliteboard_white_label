import 'package:flutter/material.dart';
import 'package:get/get.dart';

//--------------Bottom Nav Tab--------------
final selectedLabelStyleBottomNavBar =TextStyle(
    color: Get.theme.primaryColor,
    fontFamily: 'OpenSans',
    fontSize: 17);
//-------------Bottom Nav Tab-------------


//--------------Main app TextTheme--------------
final newTextTheme = Get.theme.textTheme.apply(
  bodyColor: Colors.black,
  displayColor: Colors.white,
);
//-------------- End Main app TextTheme---------------

//--------------colors constatns--------------
final warningColor = Colors.deepOrange;
final successColor = Colors.green;

//--------------end colors constants--------------

//--------------quiz result constatns--------------
final quizResultText =  TextStyle(
                              color: Get.theme.accentColor,
                              fontFamily: 'OpenSans',
                              fontSize: 20
                          );
final quizResultTrailing =  TextStyle(
    color: Get.theme.accentColor,
    fontFamily: 'OpenSans',
    fontSize: 20,
   fontWeight: FontWeight.bold,
);
//--------------end quiz result constatns--------------

final errorText = TextStyle(
  color: Colors.red,
  fontFamily: 'OpenSans',
  fontSize: 13
);

final kHintTextStyle = TextStyle(
  color: Get.theme.primaryColorLight,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Get.theme.accentColor,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final drwareMenuText = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);

final gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF73AEF5),
    Color(0xFF61A4F1),
    Color(0xFF478DE0),
    Color(0xFF398AE5),
  ],
  stops: [0.1, 0.4, 0.7, 0.9],
);

final drawerDevider = Divider(
  color:  Color(0xFF73AEF5),
);

final sizedBoxQuizCard = SizedBox(
  height: 10+.0,
);
final quizCardTitleStyle = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final quizCardTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
  fontFamily: 'OpenSans',
);

final prizeStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontFamily: 'OpenSans',
);

final BoldText = TextStyle(
  color: Colors.black,
  fontSize: 20.5,
  fontFamily: 'OpenSans',
);

//quiz question constants

final paperQuestion = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontFamily: 'OpenSans',
);

final paperQuestionOption = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: 'OpenSans',
);


