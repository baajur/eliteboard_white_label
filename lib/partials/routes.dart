//import 'package:get/get.dart';
//import 'package:flutter/material.dart';
//import 'package:eliteboard/pages/pages.dart';
//class Router {
//  static Route<dynamic> generateRoute(RouteSettings settings) {
//    switch (settings.name) {
//      case '/':
//        return GetRoute(
//          page: First(),
//          settings: settings,
//        );
//      case '/login':
//        return GetRoute(
//            settings: settings, page: Login(), transition: Transition.fade);
//      case '/second':
//        return GetRoute(
//            settings: settings, page: Second(), transition: Transition.fade);
//      default:
//        return GetRoute(
//            settings: settings,
//            transition: Transition.fade,
//            page: Scaffold(
//              body:
//              Center(child: Text('No route defined for ${settings.name}')),
//            ));
//    }
//  }
//}