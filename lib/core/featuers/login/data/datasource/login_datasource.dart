
import 'dart:convert';

import 'package:login_page_tdd/core/featuers/login/domain/entity/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_details_model.dart';

abstract class LoginDataSource {

  Future<String> getScreenNumber();
  Future setScreenNumber(String screenNumber);

  Future<bool> isRememberMe();
  Future setIsRememberMe(bool value);

  Future<UserDetails> getUserDetail();
  Future setUserDetails(UserDetailModel userDetailModel);

  Future<bool> login(String userId,String password);

}

const SCREEN_NUMBER= "SCREEN_NUMBER";
const USER_DETAILS = "USER_DETAILS";
const IS_REMEMBER_ME="IS_REMEMBER_ME";

class LoginDataSourceImpl implements LoginDataSource{

  final SharedPreferences sharedPreferences;

  LoginDataSourceImpl({required this.sharedPreferences});


  @override
  Future<String> getScreenNumber() async {
    return Future.value( sharedPreferences.getString(SCREEN_NUMBER));
  }

  @override
  Future<UserDetailModel> getUserDetail() {
    return Future.value( UserDetailModel.fromJson(jsonDecode(sharedPreferences.getString(USER_DETAILS).toString())) );

  }

  @override
  Future<bool> isRememberMe() {

    return Future.value( sharedPreferences.getBool(IS_REMEMBER_ME));

  }

  @override
  Future<bool> login(String userId, String password) {

    UserDetailModel userDetailModel=UserDetailModel.fromJson(jsonDecode(sharedPreferences.getString(USER_DETAILS).toString()));

    if(userDetailModel.userId==userId && userDetailModel.password==password){
      return Future.value(true);
    }else{
      return Future.value(false);
    }

  }

  @override
  Future setIsRememberMe(bool value) {
    return Future.value( sharedPreferences.setBool(IS_REMEMBER_ME,value));
  }

  @override
  Future setScreenNumber(String screenNumber) {
    return Future.value( sharedPreferences.setString(SCREEN_NUMBER,screenNumber));
  }

  @override
  Future setUserDetails(UserDetailModel userDetailModel) {

    final value= userDetailModel.toJson().toString();

    return Future.value(  sharedPreferences.setString(USER_DETAILS, value)  );

  }
  
  
}