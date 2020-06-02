import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/models/classroom_live_lecture_list.dart';

class LiveLectureListCard extends StatelessWidget{
  Lecture lecture;
  final VoidCallback onTap;
  LiveLectureListCard({this.lecture,this.onTap});
  @override
  Widget build(BuildContext context) {
    final text = lecture.title;
    final dateTime = lecture.createdAt;

    return GestureDetector(
        onTap: onTap,
        child: new Transform(
            origin: Offset(10.0, 10.0),
            transform: new Matrix4.translationValues( 0.0, 0 * (1.0 - 3), 0.0),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),

                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 48,
                                          width: 6,
                                          decoration: BoxDecoration(
                                            color:  Colors.purple.withOpacity(0.8),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                          ),
                                        ),

                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 1, bottom: 10),
                                                  child: Text(
                                                    text,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18,
                                                      letterSpacing: -0.1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}