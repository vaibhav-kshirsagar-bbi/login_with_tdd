import 'dart:convert';


import 'package:login_page_tdd/featuers/login/domain/entity/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../model/user_details_model.dart';

abstract class LoginDataSource {
  Future<String> getScreenNumber();

  Future setScreenNumber(String screenNumber);

  Future<bool> isRememberMe();

  Future setIsRememberMe(bool value);

  Future<UserDetails> getUserDetail();

  Future setUserDetails(UserDetailModel userDetailModel);

  Future<bool> login(String userId, String password);
}

const SCREEN_NUMBER = "SCREEN_NUMBER";
const USER_DETAILS = "USER_DETAILS";
const IS_REMEMBER_ME = "IS_REMEMBER_ME";

class LoginDataSourceImpl implements LoginDataSource {
  final SharedPreferences sharedPreferences;

  LoginDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getScreenNumber() async {

    String? data = sharedPreferences.getString(SCREEN_NUMBER);

    print("in get screen number");

    if(data!= null){
      return Future.value(data);
    }
    else{
      throw CacheException();

    }


  }

  @override
  Future<UserDetailModel> getUserDetail() {

    print("in get user details");


    String? data = sharedPreferences.getString(USER_DETAILS);

    if(data!= null){

      List<String> str = data.replaceAll("{","").replaceAll("}","").replaceAll("\"","").replaceAll("'","").split(",");
      Map<String,dynamic> result = {};
      for(int i=0;i<str.length;i++){
        List<String> s = str[i].split(":");
        result.putIfAbsent(s[0].trim(), () => s[1].trim());
      }

      return Future.value(UserDetailModel.fromJson(result));
    }
    else{
      throw CacheException();
    }



  }

  @override
  Future<bool> isRememberMe() {

    print("in is rememberme");


    bool? data = sharedPreferences.getBool(IS_REMEMBER_ME);

    if(data!= null){
      return Future.value(data);
    }
    else{
      throw CacheException();
    }



  }

  @override
  Future<bool> login(String userId, String password) async {

    print("in login");

    UserDetailModel userDetailModel = await getUserDetail();

    if (userDetailModel.userId == userId &&
        userDetailModel.password == password) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future setIsRememberMe(bool value) {

    print("in set remember me");
    return Future.value(sharedPreferences.setBool(IS_REMEMBER_ME, value));
  }

  @override
  Future setScreenNumber(String screenNumber) {
    print("in set screen number");
    return Future.value(
        sharedPreferences.setString(SCREEN_NUMBER, screenNumber));
  }

  @override
  Future setUserDetails(UserDetailModel userDetailModel) {
    print("in set user details");
    final value = userDetailModel.toJson().toString();

    return Future.value(sharedPreferences.setString(USER_DETAILS, value));
  }
}
