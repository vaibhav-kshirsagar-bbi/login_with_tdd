
import 'package:dartz/dartz.dart';

import '../../../../errors/failure.dart';
import '../repositories/login_repositories.dart';

class GetScreenNumber {
  final LoginRepositories repository;

  GetScreenNumber(this.repository);

  Future<Either<Failure, String>> call() async {
    return await repository.getScreenNumber();
  }
}
