import 'package:tdd_test_app/core/utils/typedef.dart';
import 'package:tdd_test_app/src/authentication/domain/Repositories/authentication_repository.dart';

class CreateUser {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) =>
      _repository.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );
}
