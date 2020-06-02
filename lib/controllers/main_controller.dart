import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainController extends GetController {
  bool isConnected=false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  static MainController get to => Get.put<MainController>(MainController());

  void initConnectivity() async {
    print('Checking Connectivity...');
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      isConnected=true;
    }
    createConnectionListner();
    update(this);
  }

  void createConnectionListner(){
    try {
      _connectivitySubscription =  _connectivity.onConnectivityChanged.listen((event){
        if(event == ConnectivityResult.none){
          isConnected=false;
          if(!Get.isDialogOpen)
            Get.defaultDialog(
                title: 'Network Error !',
                content: Column(
                  children: <Widget>[
                    Icon(Icons.home),
                    Text("Please Enable Mobile Data or connect to wifi.",textAlign: TextAlign.center,)
                  ],),
                buttonColor: Colors.blue,
                confirm: FlatButton(
                  onPressed: (){Get.back();},
                  child: Text('Submit'),
                  color: Get.theme.primaryColor,
                ),
                backgroundColor: Get.theme.accentColor
            );
        }else if(event == ConnectivityResult.mobile){
          isConnected=true;
        }
      });

    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}