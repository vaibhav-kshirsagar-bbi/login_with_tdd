
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:login_page_tdd/featuers/login/domain/entity/user_details.dart';

import '../../../../core/errors/failure.dart';



abstract class LoginRepositories{

  Future<Either<Failure, String>> getScreenNumber();
  Future<Either<Failure, bool>> setScreenNumber(String screenNumber);


  Future<Either<Failure, bool>> setIsRememberMe(bool value);
  Future<Either<Failure, bool>> isRememberMe();

  Future<Either<Failure, UserDetails>> getUserDetail();
  Future<Either<Failure, bool>> setUserDetails(UserDetails userDetails);

  Future<Either<Failure, bool>> login(String userId,String password);

}