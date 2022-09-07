
import 'package:login_page_tdd/core/featuers/login/domain/entity/user_details.dart';

abstract class LoginDataSource {

  Future<String> getScreenNumber();
  Future setScreenNumber(String screenNumber);

  Future<bool> isRememberMe();
  Future getIsRememberMe(bool value);

  Future<UserDetails> getUserDetail();
  Future setUserDetails(UserDetails userDetails);

  Future<bool> login(String userId,String password);

}