import 'package:eliteboard/controllers/account_details_controller.dart';
import 'package:eliteboard/controllers/classroom_live_list_controller.dart';
import 'package:eliteboard/controllers/edit_user_contact_controller.dart';
import 'package:eliteboard/controllers/edit_user_info_controller.dart';
import 'package:eliteboard/controllers/main_controller.dart';
import 'package:eliteboard/models/quiz_apply_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/pages/pages.dart';
import 'package:eliteboard/middlewares/test.dart';
import 'package:flutter/services.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:getflutter/getflutter.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

import 'pages/pages.dart';

void main() async {
  String initalRoute;
  WidgetsFlutterBinding.ensureInitialized();
  bool isLog = await isLoggedIn();
  isLog?initalRoute ='/dashboard':initalRoute='/';
  runApp(MyApp(initalRoute:initalRoute));
}

class MyApp extends StatelessWidget {

  String initalRoute;
  MyApp({this.initalRoute});
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.white,
    );
    return GetBuilder(
      init: MainController(),
      initState:(_){MainController.to.initConnectivity();},
      builder:(_){
        return GetMaterialApp(
          theme: ThemeData(
              brightness: Brightness.dark,
              backgroundColor: Colors.red,
              primaryColor: Color(0xFF6200EE),
              accentColor:  Colors.white,
              canvasColor: Colors.teal[50],
              primaryColorDark: Color(0xFF003c8f),
              primaryColorLight: Colors.purple[400],
              textSelectionColor: Colors.purple[100],
              errorColor: Colors.red,
              iconTheme: IconThemeData(
                  color : Colors.black
              ),
              fontFamily: 'Roboto',
              textTheme: newTextTheme,
          ),
          initialRoute: initalRoute,
          namedRoutes: {
            '/': GetRoute(page: Login()),
            '/login': GetRoute(page: Login()),
            '/signup': GetRoute(page: SignUp()),
            '/forgotpassword': GetRoute(page: ForgotPassword()),
            '/dashboard':GetRoute(page: Dashboard()),
            '/livequizs':GetRoute(page: LiveQuiz()),
            '/ongoingquizs':GetRoute(page:OngoingQuizs()),
            '/startupquiz':GetRoute(page:StartUpQuiz()),
            '/quizenv':GetRoute(page:QuizEnviroment()),
            '/quizdetails':GetRoute(page:QuizDetails()),
            '/quizresult':GetRoute(page:QuizResult()),
            '/newsandupdates':GetRoute(page:NewsAndUpdates()),
            '/accountdetails':GetRoute(page:AccountDetails()),
            '/edituserinfo':GetRoute(page:EditUserInfo()),
            '/editusercontact':GetRoute(page: EditUserContactInfo()),
            '/edituserbank':GetRoute(page: EditUserBankInfo()),
            '/quizapply':GetRoute(page: ConfirmQuizApplication()),
            '/quizvdis':GetRoute(page: YoutubePlayerDemoApp()),
            '/quizChapters':GetRoute(page: QuizChapters()),
            '/liveclass':GetRoute(page: ClassroomLive()),
            'livelecturelist':GetRoute(page: ClassroomLiveLectureList()),
          },
          navigatorObservers: [
            GetObserver(MiddleWare.observer),
          ],
        );
      },
    );
  }
}
