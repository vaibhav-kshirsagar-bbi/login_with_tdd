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

    if(data!= null){
      return Future.value(data);
    }
    else{
      throw CacheException();
    }


  }

  @override
  Future<UserDetailModel> getUserDetail() {

    String? data = sharedPreferences.getString(USER_DETAILS);

    if(data!= null){
      return Future.value(UserDetailModel.fromJson(
          jsonDecode(data.toString())));
    }
    else{
      throw CacheException();
    }



  }

  @override
  Future<bool> isRememberMe() {


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
    return Future.value(sharedPreferences.setBool(IS_REMEMBER_ME, value));
  }

  @override
  Future setScreenNumber(String screenNumber) {
    return Future.value(
        sharedPreferences.setString(SCREEN_NUMBER, screenNumber));
  }

  @override
  Future setUserDetails(UserDetailModel userDetailModel) {
    final value = userDetailModel.toJson().toString();

    return Future.value(sharedPreferences.setString(USER_DETAILS, value));
  }
}
