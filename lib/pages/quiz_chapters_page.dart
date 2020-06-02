import 'package:eliteboard/controllers/quiz_live_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getflutter/getflutter.dart';

import 'package:eliteboard/widgets/quiz_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/utilities/constants.dart';


class QuizChapters extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chapters Quiz'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: (){ Get.toNamed('/dashboard');},
          ),
        ),

        body: Column(
              children: <Widget>[
                SizedBox(height: Get.height * 0.1 - 10),
                Text( 'MPSC MAIN 2020',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height:20),
                Container(
                    child: Expanded(
                        flex: 1,
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: (){Get.toNamed('/quizvdis');},
                              child: GridTile(
                                child: new Card(
                                  margin: EdgeInsets.only(left:10, right: 10, top: 10, bottom: 10),
                                  color: Colors.white,
                                  child: new Center(
                                    child: new Text('demo topic $index'),
                                  ),
                                ),
                              ),
                            );
                          }),
                        )
                    )
                ),
              ]
        )
    );
  }
  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey,
                offset: const Offset(1.9, 1.9),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  letterSpacing: 0.20,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 0.20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}