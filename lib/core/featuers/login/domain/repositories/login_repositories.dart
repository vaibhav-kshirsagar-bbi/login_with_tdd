
import 'package:login_page_tdd/core/featuers/login/domain/entity/user_details.dart';


abstract class LoginRepositories{

  Future<String> getScreenNumber();
  Future setScreenNumber(String screenNumber);

  Future setIsRememberMe(bool value);
  Future<bool> isRememberMe();

  Future<UserDetails> getUserDetail();
  Future setUserDetails(UserDetails userDetails);

  Future<bool> login(String userId,String password);

}