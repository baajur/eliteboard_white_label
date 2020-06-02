import 'package:dio/dio.dart';
import 'package:eliteboard/models/state_model.dart';
import 'package:eliteboard/models/city_model.dart';
import 'package:eliteboard/models/auth_signup_errors.dart';
import 'package:eliteboard/models/auth_user_info.dart';
import 'package:eliteboard/utilities/apiconstants.dart';
import 'package:eliteboard/repositorys/local.dart';

class MastersApi{

  Future<StateResponse> fetchStates() async {
    try {
      final response = await Dio().get(
        APIURL+'getStates',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json'
          },
        ),
      );
      print(response);
      return StateResponse.fromJson(response.data);
    } catch (e) {
      print('---Api Error---');
      print(e);
      return null;
    }
  }

  Future<CityMasterResponse> fetchCitiesOfStates(int stateId) async {
    try {
      final response = await Dio().get(
        APIURL+'getCities/$stateId}',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json'
          },
        ),
      );
      print(response);
      return CityMasterResponse.fromJson(response.data);
    } catch (e) {
      print('---Api Error---');
      print(e);
      return null;
    }
  }
}