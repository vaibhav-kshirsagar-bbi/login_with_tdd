
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:login_page_tdd/core/featuers/login/domain/entity/user_details.dart';

import '../../../../errors/failure.dart';


abstract class LoginRepositories{

  Future<Either<Failure, String>> getScreenNumber();
  Future<Either<Failure, Void>> setScreenNumber(String screenNumber);

  Future<Either<Failure, Void>> setIsRememberMe(bool value);
  Future<Either<Failure, bool>> isRememberMe();

  Future<Either<Failure, UserDetails>> getUserDetail();
  Future<Either<Failure, Void>> setUserDetails(UserDetails userDetails);

  Future<Either<Failure, bool>> login(String userId,String password);

}