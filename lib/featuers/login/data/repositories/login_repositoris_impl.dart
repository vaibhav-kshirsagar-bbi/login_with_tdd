import 'dart:ffi';

import 'package:dartz/dartz.dart';

import 'package:login_page_tdd/featuers/login/data/datasource/login_datasource.dart';
import 'package:login_page_tdd/featuers/login/data/model/user_details_model.dart';
import 'package:login_page_tdd/featuers/login/domain/entity/user_details.dart';
import 'package:login_page_tdd/featuers/login/domain/repositories/login_repositories.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';



class LoginRepositoriesImpl extends LoginRepositories {
  final LoginDataSource loginDataSource;

  LoginRepositoriesImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, String>> getScreenNumber() async {
    try {

      return Future.value(Right(await loginDataSource.getScreenNumber()));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, UserDetails>> getUserDetail() async {
    try {

      return Future.value(Right(await loginDataSource.getUserDetail()));
    } on CacheException {
       return  Future.value(Left(CacheFailure as Failure));
    }
  }

  @override
  Future<Either<Failure, bool>> isRememberMe() async {
    try {
      return Future.value(Right(await loginDataSource.isRememberMe()));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> login(String userId, String password) async {
    try {
      return Future.value(Right(await loginDataSource.login(userId, password)));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> setIsRememberMe(bool value) async {
    try {
      return Future.value(Right(await loginDataSource.setIsRememberMe(value)));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> setScreenNumber(String screenNumber) async {
    try {
      return Future.value(
          Right(await loginDataSource.setScreenNumber(screenNumber)));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> setUserDetails(UserDetails userDetails) async {
    try {
      return Future.value(Right(await loginDataSource.setUserDetails(
          UserDetailModel(
              name: userDetails.name,
              age: userDetails.age,
              userId: userDetails.userId,
              password: userDetails.password))));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }
}
