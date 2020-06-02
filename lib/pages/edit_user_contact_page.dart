import 'package:eliteboard/controllers/edit_user_contact_controller.dart';
import 'package:eliteboard/controllers/edit_user_info_controller.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteboard/widgets/eliteboard_widgets.dart';
import 'package:flutter/services.dart';
import 'package:eliteboard/utilities/constants.dart';
class EditUserContactInfo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact Info'),
      ),
      body:SingleChildScrollView(
        child: GetBuilder<EditUserContactController>(
          init: EditUserContactController(),
          initState:(edit){ EditUserContactController.to.initUserInfoEdit();},
          builder:(edit){
              if(edit.items.length<1 && edit.itemsCity.length<1)
                return EliteLoading();
              else
                return Container(
              padding: EdgeInsets.only(top: 20.0),
              child: new Theme(
                data: Get.theme.copyWith(primaryColor: Colors.red),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AccountFormInputField(
                          height: 120,
                          controller:edit.address,
//                        inputType: TextInputType.text,
                          labelText: 'Address',
//                        initValue: edit.userInfo.studentName,
                          iconData: Icons.home,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        child:Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:  Icon(Icons.location_on,color: Get.theme.primaryColor,),
                            ),
                            Expanded(
                              flex: 8,
                              child:  SearchableDropdown.single(
                                  style: TextStyle(
                                    color: Get.theme.primaryColor,
                                    fontFamily: 'OpenSans',
                                  ),
                                  menuBackgroundColor: Get.theme.accentColor,
                                  closeButton:Container( child: FlatButton(child: Text('close',style: TextStyle(color: Get.theme.primaryColor),),onPressed: (){Get.back();},)),
                                  items: edit.items,
                                  value: edit.selectedValue,
                                  searchFn:(String keyword, items) {
                                    List<int> ret = List<int>();
                                    if (keyword != null && items != null && keyword.isNotEmpty) {
                                      keyword.split(" ").forEach((k) {
                                        int i = 0;
                                        items.forEach((item) {
                                          if (k.isNotEmpty &&
                                              (item.value.name
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(k.toLowerCase()))) {
                                            ret.add(i);
                                          }
                                          i++;
                                        });
                                      });
                                    }
                                    if (keyword.isEmpty) {
                                      ret = Iterable<int>.generate(items.length).toList();
                                    }
                                    return (ret);
                                  },
                                  label:Text('State',style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontFamily: 'OpenSans',
                                      fontSize: 10
                                  ),) ,
                                  hint:Text('asd',style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontFamily: 'OpenSans',
                                      fontSize: 20
                                  ),),
                                  searchHint: "Select one",
                                  onChanged: (value) {
                                    EditUserContactController.to.updateStateSelction(value);
                                  },
                                  isExpanded: true,
                                  displayClearIcon: false,
                                  icon: Icon(Icons.arrow_drop_down_circle,color: Get.theme.primaryColor,)
                              ),
                            )
                          ],
                        )
                    ),//states dropdwon
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        child:Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:  Icon(Icons.location_city,color: Get.theme.primaryColor,),
                            ),
                            Expanded(
                              flex: 8,
                              child:  SearchableDropdown.single(
                                  style: TextStyle(
                                    color: Get.theme.primaryColor,
                                    fontFamily: 'OpenSans',
                                  ),
                                  menuBackgroundColor: Get.theme.accentColor,
                                  closeButton:Container( child: FlatButton(child: Text('close',style: TextStyle(color: Get.theme.primaryColor),),onPressed: (){Get.back();},)),
                                  items: edit.itemsCity,
                                  value: edit.selectedCity,
                                  searchFn:(String keyword, items) {
                                    List<int> ret = List<int>();
                                    if (keyword != null && items != null && keyword.isNotEmpty) {
                                      keyword.split(" ").forEach((k) {
                                        int i = 0;
                                        items.forEach((item) {
                                          if (k.isNotEmpty &&
                                              (item.value.name
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(k.toLowerCase()))) {
                                            ret.add(i);
                                          }
                                          i++;
                                        });
                                      });
                                    }
                                    if (keyword.isEmpty) {
                                      ret = Iterable<int>.generate(items.length).toList();
                                    }
                                    return (ret);
                                  },
                                  label:Text('City',style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontFamily: 'OpenSans',
                                      fontSize: 10
                                  ),) ,
                                  searchHint: "Select one",
                                  onChanged: (value) {
                                    EditUserContactController.to.updateCitySelction(value);
                                  },
                                  isExpanded: true,
                                  displayClearIcon: false,
                                  icon: Icon(Icons.arrow_drop_down_circle,color: Get.theme.primaryColor,)
                              ),
                            )
                          ],
                        )
                    ),//city dropdown
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AccountFormInputField(
                          labelText: 'Pincode',
                          inputType: TextInputType.number,
                          inputFormatter:[WhitelistingTextInputFormatter.digitsOnly],
                          controller:edit.pincode,
                          iconData: Icons.pin_drop,
                        )),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AccountFormInputField(
                          labelText: 'College Name',
                          controller:edit.collegeName,
                          iconData: Icons.book,
                        )),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AccountFormInputField(
                          inputFormatter:[WhitelistingTextInputFormatter.digitsOnly],
                          labelText: 'College Pincode',
                          inputType: TextInputType.number,
                          controller:edit.collegePincode,
                          iconData: Icons.pin_drop,
                        )),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AccountFormInputField(
                          inputFormatter:[WhitelistingTextInputFormatter.digitsOnly],
                          labelText: 'Alternate Contact',
                          inputType: TextInputType.number,
                          controller:edit.alertnateContact,
                          iconData: Icons.phone,
                        )),
                    edit.errorResponse==null?
                    SizedBox.shrink():
                    ErrorList(edit.errorResponse.errors),
                    AccountFormSubmitButton(
                      onPressed: !edit.isLoading?(){
                        EditUserContactController.to.editUserInfoDetails();
                      }:null,
                      buttonTitle:edit.isLoading?'Loading..':'Update',
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}