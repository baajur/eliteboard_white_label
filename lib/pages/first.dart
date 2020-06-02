//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:eliteboard/controllers/TestController.dart';
//
//class First extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.add),
//          onPressed: () {
//            Get.snackbar("hi", "i am a modern snackbar");
//          },
//        ),
//        title: Text('First Route'),
//      ),
//      body: ListView(
//        children: <Widget>[
//          GetBuilder<TestController>(
//              init: TestController(), // INIT IT ONLY THE FIRST TIME
//              builder: (_) => FloatingActionButton(
//                  child: Text("${_.counter}"),
//                  onPressed:(){
//                    TestController.to.increment();
//                  } // This is incredibly simple!
//
//              ))  ,
//    Center(
//        child: RaisedButton(
//        child: Text('Open route'),
//        onPressed: () {
//        Get.toNamed("/second");
//        },
//        ),
//        ),
//        ],
//      ),
//    );
//  }
//}