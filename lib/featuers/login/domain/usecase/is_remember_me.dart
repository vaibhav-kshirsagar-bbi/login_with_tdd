
import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';
import '../repositories/login_repositories.dart';

class IsRememberMe {
  final LoginRepositories repository;

  IsRememberMe(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.isRememberMe();
  }
}
