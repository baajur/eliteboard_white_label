import 'package:get/get.dart';
import 'package:flutter/material.dart';
class MiddleWare {
  static observer(Routing routing) {
    if (routing.current =='/'){

    }else if (routing.current == '/second' && !routing.isSnackbar && routing.current!='/first') {
      print('2nd page');
    } else if (routing.current =='/third'){
      print('last route called');
    }
  }
}