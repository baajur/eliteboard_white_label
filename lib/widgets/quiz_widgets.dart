import 'package:flutter/material.dart';
import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:eliteboard/models/news_and_updates_model.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:eliteboard/widgets/eliteboard_widgets.dart';


//Upcomming Quiz list
class SingleQuizCard extends StatelessWidget{
  final Quiz quiz;
  final VoidCallback onTap ;

  SingleQuizCard({this.quiz, this.onTap} );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: new Transform(
        origin: Offset(10.0, 10.0),
        transform: new Matrix4.translationValues( 0.0, 0 * (1.0 - 3), 0.0),
        child:
          Padding(
          padding: const EdgeInsets.only(
            left: 15, right: 15, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(68.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Theme.of(context).splashColor,
                offset: Offset(5.1, 5.1),
                blurRadius: 0.0),
          ],
        ),

        child: Column(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4),
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
                                            quiz.paperTitle,
                                            textAlign: TextAlign.left,
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
            Padding(
              padding:
              const EdgeInsets.only(top: 1, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 48,
                                width: 2,
                                decoration: BoxDecoration(
                                      color:  Colors.purple
                                          .withOpacity(0.8),
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
                                            left: 4, bottom: 2),
                                        child: Text(
                                          'Domain ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            letterSpacing: 0.2,
                                            color: Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),

//                                                  ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(quiz.domainName,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.black
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 48,
                                width: 2,
                                decoration: BoxDecoration(
                                  color:  Colors.purple
                                      .withOpacity(0.8),
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
                                            left: 4, bottom: 2),
                                        child: Text(
                                          'Sub Domain',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily:'OpenSanse',
                                            fontSize: 14,
                                            letterSpacing: 0.2,
                                            color: Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(
                                              quiz.examSubDomainName,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'OpenSanse',
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Center(
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18.0),
                                ),
                                border: new Border.all(
                                    width: 4,
                                    color: Colors.deepPurple
                                        .withOpacity(0.5)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:  CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '₹ '+quiz.paperFee,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'OpenSanse',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      letterSpacing: 0.0,
                                      color: Colors.white,
                                    ),
                                  ),
//                                      Text(
//                                        'Rupees',
//                                        textAlign: TextAlign.center,
//                                        style: TextStyle(
//                                          fontFamily: 'OpenSanse',
//                                          fontWeight: FontWeight.bold,
//                                          fontSize: 12,
//                                          letterSpacing: 0.0,
//                                          color: Colors.black
//                                              .withOpacity(0.8),
//                                        ),
//                                      ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 8),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).splashColor,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Negative',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSanse',
                            fontSize: 14,
                            letterSpacing: 0.2,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 4,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.8),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: ((10 / 1.2) * 6),
                                  height: 4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.red,
                                      Colors.orange
                                          .withOpacity(0.5),
                                    ]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child:
                            Text(quiz.negativeMarkFlag?'Yes':'No',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'OpenSanse',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Duration',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSanse',
                            fontSize: 14,
                            letterSpacing: 0.2,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 4,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.8),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: ((10 / 1.2) * 6),
                                  height: 4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.red,
                                      Colors.orange
                                          .withOpacity(0.5),
                                    ]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            quiz.paperDuration+' min' ,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'OpenSanse',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Questions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'OpenSanse',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            letterSpacing: 0.2,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 4,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.8),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: ((10 / 1.2) * 6),
                                  height: 4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.red,
                                      Colors.orange
                                          .withOpacity(0.5),
                                    ]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            quiz.paperMarks,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'OpenSanse',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
     ))));

//        GFCard(
//        elevation: 10,
//        height: 150,
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//        color: Colors.teal[50],
//        title: GFListTile(
//          margin: EdgeInsets.all(0.0),
//          title: Text(quiz.paperTitle,style: quizCardTitleStyle),
//          subTitle: Text(quiz.paperDate+' / '+quiz.paperTime, style: TextStyle(color: Colors.black87)),
//          icon: GFButton(
//            color: Theme.of(context).primaryColor,
//            text: '₹ '+quiz.paperFee,
//            textStyle: prizeStyle,
//            shape: GFButtonShape.pills,
//          ),
//        ),
//        content: Column(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Expanded(
//                  flex: 2,
//                  child:
//                  Text('➤ '+quiz.domainName,style: quizCardTextStyle),
//                ),
//                Expanded(
//                  flex: 3,
//                  child:Text('➤ '+quiz.examSubDomainName,style: quizCardTextStyle),
//                )
//              ],
//            ),
//          ],
//        ),
//      ),

  }
}

class NewsAndDetailsCard extends StatelessWidget{
  News quiz;
  NewsAndDetailsCard(this.quiz);

  @override
  Widget build(BuildContext context) {
    final text = quiz.newsDescription;
    final dateTime = quiz.created_at;

    return GestureDetector(
        onTap: () {
          Get.toNamed('', arguments:quiz);
        },
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
                                                    quiz.newsHeading,
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
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 1, left: 16, right: 16, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ReadMoreText(text, 60.0, dateTime, expandingButtonColor: Theme.of(context).primaryColor),
                          )],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}

class SingleOngoingQuizCard extends StatelessWidget{
  Quiz quiz;
  SingleOngoingQuizCard(this.quiz);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: new Transform(
            origin: Offset(10.0, 10.0),
            transform: new Matrix4.translationValues( 0.0, 0 * (1.0 - 3), 0.0),
            child:
            Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(68.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context).splashColor,
                          offset: Offset(5.1, 5.1),
                          blurRadius: 0.0),
                    ],
                  ),

                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 4),
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
                                                    quiz.paperTitle,
                                                    textAlign: TextAlign.left,
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
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 4),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 48,
                                          width: 2,
                                          decoration: BoxDecoration(
                                            color:  Colors.purple
                                                .withOpacity(0.8),
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
                                                      left: 4, bottom: 2),
                                                  child: Text(
                                                    'Domain',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                      letterSpacing: 0.2,
                                                      color: Colors.black.withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 4, bottom: 3),
                                                      child: Text(
                                                        quiz.domainName,
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                    ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 48,
                                          width: 2,
                                          decoration: BoxDecoration(
                                            color:  Colors.purple
                                                .withOpacity(0.8),
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
                                                      left: 4, bottom: 2),
                                                  child: Text(
                                                    'Sub Domain',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:'OpenSanse',
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                      letterSpacing: 0.2,
                                                      color: Colors.black.withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 4, bottom: 3),
                                                      child: Text(
                                                        quiz.examSubDomainName,
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontFamily: 'OpenSanse',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Center(
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: Get.width * 0.3,
                                        height: Get.height * 0.1,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColorLight,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50.0),
                                          ),
                                          border: new Border.all(
                                              width: 4,
                                              color: Colors.deepPurple
                                                  .withOpacity(0.5)),
                                        ),
                                        child: ButtonTheme(
                                          padding: EdgeInsets.all(0.0),
                                          minWidth: double.infinity,
                                          child: FlatButton(
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            padding: EdgeInsets.all(0.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                                side: BorderSide(color: Theme.of(context).primaryColorLight)
                                            ),
                                            disabledColor: Theme.of(context).accentColor,
                                            color: Colors.teal[50],
                                            child: Text('Start Quiz',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).primaryColor
                                              ),
                                            ),
                                            onPressed:()=>Get.toNamed('/startupquiz', arguments:quiz),
                                          ),
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 10, bottom: 10),
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            color: Theme.of(context).splashColor,
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 8, bottom: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Negative',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'OpenSanse',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      letterSpacing: 0.2,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Container(
                                      height: 4,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: ((10 / 1.2) * 6),
                                            height: 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.red,
                                                Colors.orange
                                                    .withOpacity(0.5),
                                              ]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child:
                                    Text(quiz.negativeMarkFlag?'Yes':'No',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'OpenSanse',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Duration',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'OpenSanse',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      letterSpacing: 0.2,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Container(
                                      height: 4,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: ((10 / 1.2) * 6),
                                            height: 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.red,
                                                Colors.orange
                                                    .withOpacity(0.5),
                                              ]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      quiz.paperDuration+' min' ,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'OpenSanse',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Questions',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'OpenSanse',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: 0.2,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Container(
                                      height: 4,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: ((10 / 1.2) * 6),
                                            height: 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.red,
                                                Colors.orange
                                                    .withOpacity(0.5),
                                              ]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      quiz.paperMarks,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'OpenSanse',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
class CurvePainter extends CustomPainter {
  final double angle;
  final List<Color> colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = List<Color>();
    if (colors != null) {
      colorsList = colors;
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}

//quiz result single tile
class QuizResultSingleTile extends StatelessWidget{

  final String title;
  final String trailing;
  final IconData iconData;

  QuizResultSingleTile({this.title, this.trailing, this.iconData});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: Icon(iconData,color: Get.theme.accentColor,size: Get.width*0.08,),
        title: Text(title,style: quizResultText),
        trailing: Text(trailing,style: quizResultTrailing),
      ),
    );
  }
}

// quiz result card
class QuizResultCard extends StatelessWidget {

  final Quiz quiz;
  final Color cardColor;
  final double loadingPercent;
  final int correctCnt;
  final int wrongCnt;
  final int attemptCnt;
  final int totalQes;
  final String timeTaken;
  QuizResultCard({
    this.cardColor,
    this.loadingPercent,
    this.quiz,
    this.attemptCnt,
    this.correctCnt,
    this.wrongCnt,
    this.totalQes,
    this.timeTaken
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        padding: EdgeInsets.all(15.0),
        height: Get.height,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: CircularPercentIndicator(
                      animation: true,
                      radius: Get.width*0.2,
                      percent: loadingPercent,
                      lineWidth: 5.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.white10,
                      progressColor: Colors.white,
                      center: Text(
                        '${(loadingPercent*100).round()}%',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  ),
                ),
                Text(""+quiz.paperTitle,style: quizResultText,),
                drawerDevider,
                QuizResultSingleTile(
                  title:"Total Questions",
                  iconData:Icons.help,
                  trailing:"$totalQes",
                ),
                QuizResultSingleTile(
                  title:"Questions Attempted",
                  iconData:Icons.done_all,
                  trailing:"$attemptCnt",
                ),
                QuizResultSingleTile(
                  title:"Questions Correct",
                  iconData:Icons.done,
                  trailing:"$correctCnt",
                ),
                QuizResultSingleTile(
                  title:"Questions Wrong",
                  iconData:Icons.clear,
                  trailing:"$wrongCnt",
                ),
                QuizResultSingleTile(
                  title:"Time Taken",
                  iconData:Icons.watch_later,
                  trailing:"$timeTaken",
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed:(){
                      Get.defaultDialog(
                          custom:Text('asd',style: TextStyle(color: Get.theme.primaryColor),),
                          title: 'Result Information',
                          content: Column(
                              children: <Widget>[
                                Icon(Icons.info_outline,size: Get.width*0.2,color: Get.theme.primaryColor,),
                                Text('Overall quiz results will be declared soon.\nRanks will be calculated according to user score & time taken to complete quiz.',textAlign: TextAlign.center,)
                              ],
                            ),
                          buttonColor: Colors.blue,
                          confirm: FlatButton(
                            onPressed: (){
                              Get.offAllNamed('/dashboard');
                              },
                            disabledColor: Colors.red,
                            child: Text('Ok'),
                            color: successColor,
                          ),
                          backgroundColor: Get.theme.accentColor
                      );
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.white,
                    child: Text(
                      'Go To Dashboard',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Quiz Start container
class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  TopContainer({this.height, this.width, this.child, this.padding});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding!=null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
//class MyBackButton extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Hero(
//      tag: 'backButton',
//      child: GestureDetector(
//        onTap: (){
//          Navigator.pop(context);
//        },
//        child: Align(
//          alignment: Alignment.centerLeft,
//          child: Icon(
//            Icons.arrow_back_ios,
//            size: 25,
//            color: Theme.of(context).primaryColor,
//          ),
//        ),
//      ),
//    );
//  }
//}