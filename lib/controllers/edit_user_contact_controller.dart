import 'package:eliteboard/repositorys/user_repo.dart';
import 'package:eliteboard/models/city_model.dart';
import 'package:eliteboard/models/state_model.dart';
import 'package:get/get.dart';
import 'package:eliteboard/models/auth_user_contact_info.dart';
import 'package:flutter/material.dart';
import 'package:eliteboard/models/error_response.dart';
import 'package:eliteboard/repositorys/masters.dart';

class EditUserContactController extends GetController {
  StateResponse stateResponse;
  CityMasterResponse cityMasterResponse;
  UserContactInfo userContactInfo;
  ErrorResponse errorResponse;
  bool isLoading = false;
  States selectedValue;
  Cities selectedCity;
  TextEditingController address = new TextEditingController();
  TextEditingController pincode = new TextEditingController();
  TextEditingController collegeName = new TextEditingController();
  TextEditingController collegePincode = new TextEditingController();
  TextEditingController alertnateContact = new TextEditingController();

  final List<DropdownMenuItem> items = [];
  final List<DropdownMenuItem> itemsCity=[];
  static EditUserContactController get to => Get.find();

  void initUserInfoEdit() async{
    userContactInfo=Get.arguments;

    MastersApi mApi = new MastersApi();
    final response = await mApi.fetchStates();
    final cityApiResponse = await mApi.fetchCitiesOfStates(userContactInfo.state);
    if(response!=null) {
      stateResponse = response;
      cityMasterResponse = cityApiResponse;
      for(int i=0;i<stateResponse.states.length;i++){
        items.add(DropdownMenuItem(
          child: Text(stateResponse.states[i].name),
          value: stateResponse.states[i],
        ));
      }
      if(cityApiResponse!=null)
      for(int i=0;i<cityMasterResponse.cities.length;i++){
        itemsCity.add(DropdownMenuItem(
          child: Text(cityMasterResponse.cities[i].name),
          value: cityMasterResponse.cities[i],
        ));
      }
    }
    address.text = userContactInfo.address;
    pincode.text = userContactInfo.pinCode;
    collegeName.text = userContactInfo.collegeName;
    collegePincode.text = userContactInfo.collegePinCode;
    alertnateContact.text = userContactInfo.alternateContact;
    if(userContactInfo.state!=null){
      selectedValue = stateResponse.states.where((element) => element.id==userContactInfo.state).toList().elementAt(0);
      selectedCity = cityMasterResponse.cities.where((element) => element.id==userContactInfo.city).toList().elementAt(0);
    }
    update(this);
  }

  void editUserInfoDetails() async{
//      print();
      isLoading = true;
      update(this);
      UserContactInfo uci = new UserContactInfo(
        address: address.text,
        alternateContact: alertnateContact.text,
        city: selectedCity.id,
        state: selectedValue.id,
        pinCode: pincode.text,
        collegeName: collegeName.text,
        collegePinCode: collegePincode.text
      );
      AuthApi api = new AuthApi();
      final response = await api.editUserContactInfo(uci);
      if(response is UserContactInfo){
        Get.back(result: 'success');
      }
      else if(response is ErrorResponse){
        errorResponse = response;
      }
      isLoading = false;
      update(this);
  }

  void updateStateSelction(States value) async{
      selectedValue = value;
      itemsCity.clear();
      selectedCity = null;
      update(this);
      MastersApi mApi = new MastersApi();
      final cityApiResponse = await mApi.fetchCitiesOfStates(selectedValue.id);
      if(cityApiResponse!=null){
        cityMasterResponse = cityApiResponse;
        for(int i=0;i<cityMasterResponse.cities.length;i++){
          itemsCity.add(DropdownMenuItem(
            child: Text(cityMasterResponse.cities[i].name),
            value: cityMasterResponse.cities[i],
          ));
        }
      }
      update(this);
  }

  void updateCitySelction(Cities value){
      selectedCity = value;
  }

}