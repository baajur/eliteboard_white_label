import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:eliteboard/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/controllers/quiz_apply_confirmation_controller.dart';
import 'package:upi_india/upi_india.dart';

class ConfirmQuizApplication extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Confirmation'),
      ),
      body:SingleChildScrollView(
        child: GetBuilder<ConfirmQuizApplyController>(
          init:ConfirmQuizApplyController(),
          initState: (confirm){ConfirmQuizApplyController.to.initPaymetOptions();},
          builder: (confirm){
              if(confirm.isFetchingApps)
                return EliteLoading();
              else
              return Container(
                padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: Get.width,
                      decoration: BoxDecoration(
                        color: Get.theme.accentColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        border: Border.all(
                            width: 1,
                            color:Get.theme.primaryColorLight
                                .withOpacity(0.5)),
                      ),
                    child:Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Center(
                            child: Text(confirm.quiz.paperTitle,style: TextStyle(
                                fontSize: Get.height*0.023,
                                color: Get.theme.primaryColor
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Text ('${confirm.quiz.paperFee} ₹',style: TextStyle(
                                fontSize: Get.height*0.05,
                                color: Get.theme.primaryColor,
                              fontWeight: FontWeight.bold
                            ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30,),
                          Text('* Your application for quiz will be confirmed after successful payment.',style: TextStyle(
                              fontSize: 13,
//                            color: Get.theme.primaryColor
                          ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10,),
                          Text('* All prices are includiing gst.',style: TextStyle(
                            fontSize: 13,
//                            color: Get.theme.primaryColor
                          ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10,),
                          Text('* Please read our non refundable policy in privacy policy.',style: TextStyle(
                            fontSize: 13,
//                            color: Get.theme.primaryColor
                          ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: 10,),
                  Text('Select Payment App ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                   SizedBox(height: 10,),
                   ListView.builder(
//                      physics: ScrollPhy,
                       shrinkWrap: true,
                      itemCount: confirm.apps.length,
                      itemBuilder: (context, index) {
                        UpiIndiaApp app = ConfirmQuizApplyController.to.apps[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Get.theme.accentColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              border: Border.all(
                                  width: 1,
                                  color:Get.theme.primaryColorLight
                                      .withOpacity(0.5)),
                            ),
                            child: ListTile(
                              onTap: () {
                                ConfirmQuizApplyController.to.initiateTransaction(app.app);
                              },
                              trailing: Icon(Icons.arrow_forward_ios,color: Get.theme.primaryColor,),
                              leading:Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.memory(
                                    app.icon,
                                    height: 60,
                                    width: 60,
                                  ),
                              ),
                              
                              title: Text(app.name),
//                          subtitle:
//                          Text("Total infecteds: ${app.}"),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}