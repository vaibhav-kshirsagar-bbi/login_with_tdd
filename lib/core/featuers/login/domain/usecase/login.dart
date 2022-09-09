
import 'package:dartz/dartz.dart';

import '../../../../errors/failure.dart';
import '../repositories/login_repositories.dart';

class Login {
  final LoginRepositories repository;

  Login(this.repository);

  Future<Either<Failure, bool>> call({required String userId,required String password}) async {
    return await repository.login(userId, password);
  }
}
