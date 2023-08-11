import 'package:login_page_tdd/core/featuers/login/data/datasource/login_datasource.dart';
import 'package:login_page_tdd/core/featuers/login/data/model/user_details_model.dart';
import 'package:login_page_tdd/core/featuers/login/domain/entity/user_details.dart';
import 'package:login_page_tdd/core/featuers/login/domain/repositories/login_repositories.dart';

class LoginRepositoriesImpl extends LoginRepositories{

  final LoginDataSource loginDataSource;

  LoginRepositoriesImpl({required this.loginDataSource});


  @override
  Future setIsRememberMe(bool value) {
    // TODO: implement getIsRememberMe
    return loginDataSource.setIsRememberMe(value);
  }

  @override
  Future<String> getScreenNumber() {
    // TODO: implement getScreenNumber
    return loginDataSource.getScreenNumber();
  }

  @override
  Future<UserDetails> getUserDetail() {
    // TODO: implement getUserDetail
    return loginDataSource.getUserDetail();
  }

  @override
  Future<bool> isRememberMe() {
    // TODO: implement isRememberMe
    return loginDataSource.isRememberMe();
  }

  @override
  Future<bool> login(String userId, String password) {
    // TODO: implement login
    return loginDataSource.login(userId, password);
    
  }

  @override
  Future setScreenNumber(String screenNumber) {
    // TODO: implement setScreenNumber
    return loginDataSource.setScreenNumber(screenNumber);
  }

  @override
  Future setUserDetails(UserDetails userDetails) {
    // TODO: implement setUserDetails
    return loginDataSource.setUserDetails(UserDetailModel(name: userDetails.name, age: userDetails.age, userId: userDetails.userId, password: userDetails.password));
  }
  
  
  
}