
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:login_page_tdd/core/errors/failure.dart';

import '../repositories/login_repositories.dart';

class SetScreenNumber {
  final LoginRepositories repository;

  SetScreenNumber(this.repository);

  Future<Either<Failure, Void>> call({required String screenNumber}) async {
    return await repository.setScreenNumber(screenNumber);
  }
}
