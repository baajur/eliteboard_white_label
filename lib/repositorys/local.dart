import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString("accessToken");
  if (token!=null) {
    return true;
  } else
    return false;
}

Future<String> getStoredUserToken() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString("accessToken");
  return token;
}

void logoutLocal() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
}

Future<String> getuserName() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String name = preferences.getString("userName");
  return name;
  String email = preferences.getString("userEmail");
}

Future<String> getUserEmail() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String email = preferences.getString("userEmail");
  return email;
}