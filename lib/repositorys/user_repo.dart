import 'package:dio/dio.dart';
import 'package:eliteboard/models/Auth.dart';
import 'package:eliteboard/models/auth_user_bank_info.dart';
import 'package:eliteboard/models/common_response.dart';
import 'package:eliteboard/models/auth_signup_errors.dart';
import 'package:eliteboard/models/auth_user_info.dart';
import 'package:eliteboard/utilities/apiconstants.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:eliteboard/models/error_response.dart';
import 'package:eliteboard/models/auth_user_contact_info.dart';
class AuthApi{

  Future<Auth> fetchData(String email,String password) async {
    try {
      final response = await Dio().post(
        BASEURL+'oauth/token',
        data:{	"grant_type":"password",
          "client_id":"2",
          "client_secret":"jwXl9Q38xNiCjE3EZPtVLyzWTaDANDMiRStvaNjT",
          "username":email,
          "password":password},
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json'
          },
        ),
      );
      return Auth.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> signUp(FormData fD) async {
    try {
      final response = await Dio().post(
        APIURL+'eliteBoardUser',
        data:fD,
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json'
          },
        ),
      );
      return CommonResponse.fromJson(response.data);
    } on DioError catch(e) {
      if(e.response!=null) {
       return  SignUpError.fromJson(e.response.data);
      } else{
        return null;
      }
    }
  }


  //fetch user info
  Future<UserInfo> userInfo() async {
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().get(
        APIURL+'user',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print(response);
      return UserInfo.fromJson(response.data);
    } on DioError catch(e) {
      if(e.response!=null) {
        return  UserInfo.fromJson(e.response.data);
      } else{
        return null;
      }
    }
  }

  //edit user info
  Future<dynamic> editUserInfo(UserInfo ui) async {
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().put(
        APIURL+'eliteBoardUser/1',
        data:{
          "name":ui.studentName,
          "email":ui.email,
          "contact":ui.studentContact
        },
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      return UserInfo.fromJson(response.data);
    } on DioError catch(e) {
      print(e.response);
      if(e.response!=null) {
        return  ErrorResponse.fromJson(e.response.data);
      } else{
        return null;
      }
    }
  }

  //get user contact/address info
  Future<UserContactInfo> userContactInfo() async {
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().get(
        APIURL+'getContactDetails',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print('------API----');
      print(response);
      return UserContactInfo.fromJson(response.data);
    } on DioError catch(e) {
      print('------API ERROR----');
      print(e);
      if(e.response!=null) {
        return  UserContactInfo.fromJson(e.response.data);
      } else{
        return null;
      }
    }
  }

  Future<dynamic> editUserContactInfo(UserContactInfo uci) async{
    String accessToken =  await getStoredUserToken();
    print(uci.toJson());
    try {
      final response = await Dio().put(
        APIURL+'updateContactDetails',
        data: {
          "state": uci.state,
          "city": uci.city,
          "address": uci.address,
          "pinCode": uci.pinCode,
          "collegeName":uci.collegeName,
          "collegePinCode": uci.collegePinCode,
          "alternateContact": uci.alternateContact
        },
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print('------edit contact API----');
      print(response);
      return UserContactInfo.fromJson(response.data);
    } on DioError catch(e) {
      print('------API ERROR----');
      print(e);
      if(e.response!=null) {
        return  ErrorResponse.fromJson(e.response.data);
      } else{
        return null;
      }
    }
  }

  //get user contact/address info
  Future<UserBankDetails> userBankInfo() async {
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().get(
        APIURL+'getBankDetails',
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print('------API----');
      print(response);
      return UserBankDetails.fromJson(response.data);
    } on DioError catch(e) {
      print('------API ERROR----');
      print(e);
        return null;
      }
  }

  Future<dynamic> editUserBankInfo(UserBankDetails ubi) async{
    String accessToken =  await getStoredUserToken();
    try {
      final response = await Dio().put(
        APIURL+'updateBankDetails',
        data: {
          "accountHolderName": ubi.accountHolderName,
          "bankAccountNumber": ubi.accountNumber,
          "name": ubi.name,
          "ifsc": ubi.ifsc,
          "address": ubi.address
        },
        options: Options(
          headers: {
            Headers.acceptHeader: 'application/json',
            Headers.contentTypeHeader:'application/json',
            'Authorization':'Bearer '+accessToken
          },
        ),
      );
      print('------API----');
      print(response);
      return UserBankDetails.fromJson(response.data);
    } on DioError catch(e) {
      print('------API ERROR----');
      print(e);
      if(e.response!=null) {
        return  ErrorResponse.fromJson(e.response.data);
      } else{
        return null;
      }
    }
  }
}
