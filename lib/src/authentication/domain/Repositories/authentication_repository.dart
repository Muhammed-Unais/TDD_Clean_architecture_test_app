//this meant to be a contract, meant to be an interface
//it should define

import 'package:tdd_test_app/core/utils/typedef.dart';
import 'package:tdd_test_app/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUser();
}
