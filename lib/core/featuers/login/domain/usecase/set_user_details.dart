
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:login_page_tdd/core/featuers/login/domain/entity/user_details.dart';

import '../../../../errors/failure.dart';
import '../repositories/login_repositories.dart';

class SetUserDetails {
  final LoginRepositories repository;

  SetUserDetails(this.repository);

  Future<Either<Failure, Void>> call({required UserDetails userDetails}) async {
    return await repository.setUserDetails(userDetails);
  }
}
