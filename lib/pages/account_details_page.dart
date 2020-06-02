import 'package:flutter/material.dart';
import 'package:eliteboard/controllers/account_details_controller.dart';
import  'package:eliteboard/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliteboard/widgets/eliteboard_widgets.dart';
import 'package:getflutter/getflutter.dart';
import 'package:shimmer/shimmer.dart';

class AccountDetails extends StatelessWidget {

  static  TextStyle optionStyle =
  TextStyle(
      color: Get.theme.primaryColorLight,
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    SizedBox sizedBox = SizedBox(height: 30,);


    return GetBuilder<AccountDetailsController>(
      init:AccountDetailsController(),
      initState: (ad){
          AccountDetailsController.to.fecthUserInfo();
          AccountDetailsController.to.fecthUserContactInfo();
          AccountDetailsController.to.fecthUserBankInfo();
        },
      builder:(ad){
        return Scaffold(
          appBar: AppBar(title: Text('Account Details'),),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: Get.height * 0.1),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      child: Icon(Icons.person,color: Get.theme.primaryColor,size: Get.width*0.2,),
                      maxRadius: Get.width * 0.15,
                      backgroundColor:Get.theme.accentColor,
                    ),
                  ),
                  GetBuilder<AccountDetailsController>(
                    builder:(ad){
                      if(ad.userInfo==null)
                        return Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.white,
                          child: Text('Account Owner',style: TextStyle(
                              fontSize: Get.width*0.05,
                              color: Get.theme.primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ));
                      else
                        return Text(ad.userInfo.studentName,style: TextStyle(
                              fontSize: Get.width*0.05,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                      );
                    }
                  ),
                  GetBuilder<AccountDetailsController>(
                      builder:(ad){
                        if(ad.userInfo==null)
                          return Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white,
                              child: Text('Owner Contact',style: TextStyle(
                                  fontSize: Get.width*0.05,
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.bold
                              ),
                              ));
                        else
                          return Text(ad.userInfo.studentContact,style: TextStyle(
                              fontSize: Get.width*0.03,
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.bold
                          ),
                          );
                      }
                  ),
                  SizedBox(height: Get.height * 0.1),
                  GFAccordion(
                    margin: EdgeInsets.all(20.0),
                    titleChild: Text('Personal Details',style: TextStyle(color: Get.theme.accentColor),),
                    contentChild:Container(
                      child:GetBuilder<AccountDetailsController>(
                        initState:(edit){ AccountDetailsController.to.fecthUserInfo();},
                        builder: (user){
                          if(user.userInfo==null)
                           return Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InfoTile(title:'Name',subTitle: 'loading..', ),
                                InfoTile(title:'Contact',subTitle: 'loading..',),
                                InfoTile(title:'Email',subTitle: 'loading..',),
                              ],
                            ),
                          );
                          else
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(),
                                InfoTile(title:'Name',subTitle: user.userInfo.studentName, ),
                                InfoTile(title:'Contact',subTitle: user.userInfo.studentContact,),
                                InfoTile(title:'Email',subTitle: user.userInfo.email,),
                              ],
                            );

                        },
                      ),
                    ),
                    collapsedIcon: Icon(Icons.add,color: Get.theme.accentColor,),
                    expandedIcon: Row(children: <Widget>[
                      GetBuilder<AccountDetailsController>(
                        builder: (user){
                          return  GestureDetector(
                            onTap: (){
                              if(user.userInfo!=null)
                                AccountDetailsController.to.edit();
                            },
                            child: Icon(Icons.edit,color:Get.theme.accentColor,),
                          );
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.minimize,color: Get.theme.accentColor,)),

                    ],),
                    contentbackgroundColor: Get.theme.accentColor,
                    collapsedTitlebackgroundColor: Get.theme.primaryColor,
                    expandedTitlebackgroundColor: Get.theme.primaryColorLight,
                  ),
                  GFAccordion(
                    margin: EdgeInsets.all(20.0),
                    titleChild: Text('General Details',style: TextStyle(color: Get.theme.accentColor),),
                    collapsedIcon: Icon(Icons.add,color: Get.theme.accentColor,),
                    expandedIcon: Row(children: <Widget>[
                      GetBuilder<AccountDetailsController>(
                        builder: (user){
                          return  GestureDetector(
                            onTap: (){
                              if(user.userContactInfo!=null)
                                AccountDetailsController.to.editContactDetails();
                            },
                            child: Icon(Icons.edit,color:Get.theme.accentColor,),
                          );
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.minimize,color: Get.theme.accentColor,)),

                    ],),
                    contentbackgroundColor:Get.theme.accentColor,
                    collapsedTitlebackgroundColor: Get.theme.primaryColor,
                    expandedTitlebackgroundColor: Get.theme.primaryColorLight,
                    contentChild:GetBuilder<AccountDetailsController>(
                      initState:(edit){ AccountDetailsController.to.fecthUserInfo();},
                      builder: (user){
                        if(user.userContactInfo==null)
                          return Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InfoTile(title:'Name',subTitle: 'loading..',),
                                InfoTile(title:'Contact',subTitle: 'loading..',),
                                InfoTile(title:'Email',subTitle: 'loading..',),
                              ],
                            ),
                          );
                        else
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InfoTile(title:'Address',subTitle: user.userContactInfo.address??'_',),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:1,
                                    child: InfoTile(title:'State',subTitle: user.userContactInfo.stateName??'_',),
                                  ),
                                  Expanded(
                                    flex:1,
                                    child:InfoTile(title:'City',subTitle: user.userContactInfo.cityName??'_',),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:1,
                                    child:  InfoTile(title:'Pincode',subTitle: user.userContactInfo.pinCode??'_',),
                                  ),
                                  Expanded(
                                    flex:1,
                                    child: InfoTile(title:'Alertnative Contact',subTitle: user.userContactInfo.alternateContact??'_',),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:1,
                                    child:InfoTile(title:'College',subTitle: user.userContactInfo.collegeName??'_',),
                                  ),
                                  Expanded(
                                    flex:1,
                                    child:InfoTile(title:'College Pincode',subTitle: user.userContactInfo.collegePinCode??'_',),
                                  ),
                                ],
                              ),
                            ],
                          );

                      },
                    ),
                  ),
                  GFAccordion(
                    margin: EdgeInsets.all(20.0),
                    titleChild: Text('Bank/Payment Details',style: TextStyle(color: Get.theme.accentColor),),
                    contentChild: GetBuilder<AccountDetailsController>(
                      initState:(edit){ AccountDetailsController.to.fecthUserBankInfo();},
                      builder: (user){
                        if(user.userBankDetails==null)
                          return Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InfoTile(title:'Name',subTitle: 'loading..',),
                                InfoTile(title:'Contact',subTitle: 'loading..',),
                                InfoTile(title:'Email',subTitle: 'loading..',),
                              ],
                            ),
                          );
                        else
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InfoTile(title:'Name',subTitle: user.userBankDetails.name??'_',),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:1,
                                    child:  InfoTile(title:'Account Number',subTitle: user.userBankDetails.accountNumber??'_',),
                                  ),
                                  Expanded(
                                    flex:1,
                                    child: InfoTile(title:'IFSC Code',subTitle: user.userBankDetails.ifsc??'_',),
                                  ),
                                ],
                              ),
                              InfoTile(title:'Account Holder Name',subTitle: user.userBankDetails.accountHolderName??'_',),
                              InfoTile(title:'Address',subTitle: user.userBankDetails.address??'_',),
                            ],
                          );

                      },
                    ),
                    collapsedIcon: Icon(Icons.add,color: Get.theme.accentColor,),
                    expandedIcon: Row(children: <Widget>[
                      GetBuilder<AccountDetailsController>(
                        builder: (user){
                          return  GestureDetector(
                            onTap: (){
                              if(user.userBankDetails!=null)
                                AccountDetailsController.to.editBankDetails();
                            },
                            child: Icon(Icons.edit,color:Get.theme.accentColor,),
                          );
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.minimize,color: Get.theme.accentColor,)),

                    ],),
                    contentbackgroundColor:Get.theme.accentColor,
                    collapsedTitlebackgroundColor: Get.theme.primaryColor,
                    expandedTitlebackgroundColor: Get.theme.primaryColorLight,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}