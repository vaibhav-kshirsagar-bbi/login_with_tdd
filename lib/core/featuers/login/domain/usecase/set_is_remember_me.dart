
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:login_page_tdd/core/errors/failure.dart';

import '../repositories/login_repositories.dart';

class SetIsRememberMe {
  final LoginRepositories repository;

  SetIsRememberMe(this.repository);

  Future<Either<Failure, Void>> call({required bool value}) async {
    return await repository.setIsRememberMe(value);
  }
}
