import 'package:flutter/material.dart';
import 'package:eliteboard/controllers/quiz_details_controller.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:get/get.dart';

import 'package:eliteboard/theme/light_colors.dart';
import 'package:eliteboard/widgets/dashboard_widgets.dart';


class QuizDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Details'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
//        title: Text("Quiz Details"),
      ),

      body: GetBuilder<QuizDetailsController>(
          init: QuizDetailsController(),
          initState:(_){QuizDetailsController.to.detailsQuiz();},
          builder:(_) {
          if(_.quizDetails == null)
            return Container(
              child: Center(
                child: CircularProgressIndicator (
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            );
          else
          return Container(

            child: ListView(
            children: <Widget>[
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "./assets/trpy1.jpg",
                        height: 250,
                        width: MediaQuery.of(context).size.width-40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),


          SizedBox(height: 20),

          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _.quizDetails.titile,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  IconButton(
                    icon: Icon(
                      Icons.label_important,
                      color: Colors.black,
                    ),
                    onPressed: (){},
                  ),

                ],
              ),

              Row(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.green,
                  ),

                  SizedBox(width: 3),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Domain: "+ _.quiz.domainName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.green,
                  ),

                  SizedBox(width: 3),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sub Domain: "+ _.quiz.examSubDomainName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),

                ],
              ),

              SizedBox(height: 20),

              Container(
                alignment: Alignment.centerLeft,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "./assets/trpy1.jpg",
                      height: 30,
                      width: 30,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "₹ 4500",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),

                    Image.asset(
                      "./assets/trpy1.jpg",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "₹ 2000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),

                    Image.asset(
                      "./assets/trpy1.jpg",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "₹ 1000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    getTimeBoxUI('Yes', 'Negative'),
                    getTimeBoxUI('2hours', 'Duration'),
                    getTimeBoxUI('24', 'Questions'),
                  ],
                ),
              ),

              SizedBox(height: 40),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 10),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  _.quizDetails.note,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),

  //        bottomNavigationBar: Container(
  //        height: 50,
  //        child: RaisedButton(
  //          elevation: 15,
  //          color: Theme.of(context).primaryColor,
  //          child: Text(
  //            "Apply for Quiz",
  //            style: TextStyle(
  //              color: Theme.of(context).accentColor,
  //            ),
  //          ),
  //          onPressed: (){},
  //        ),
  //      ),
          );
          },
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () => Get.toNamed('/'),
//        backgroundColor: Theme.of(context).primaryColor,
//        icon: Icon(Icons.check, color: Colors.lightGreenAccent,),
//        label: Text("Apply for Quiz!", style: TextStyle(color: Theme.of(context).accentColor)),
      bottomNavigationBar: GetBuilder<QuizDetailsController>(
        builder: (q){
          if(q.quizDetails!=null)
            return  RaisedButton(
              onPressed: () {
                          Get.toNamed('/quizapply',arguments:q.quiz );
              },
              color: Get.theme.primaryColor,
              textColor: Colors.white,
              child: Text('Apply Now'),
            );
          else
            return SizedBox.shrink();
        },
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100.0,
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
                  fontSize: 16,
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