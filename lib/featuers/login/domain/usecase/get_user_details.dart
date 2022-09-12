
import 'package:dartz/dartz.dart';
import 'package:login_page_tdd/featuers/login/domain/entity/user_details.dart';



import '../../../../core/errors/failure.dart';
import '../entity/user_details.dart';
import '../repositories/login_repositories.dart';

class GetUserDetails {
  final LoginRepositories repository;

  GetUserDetails(this.repository);

  Future<Either<Failure, UserDetails>> call() async {
    return await repository.getUserDetail();
  }
}
