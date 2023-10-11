import 'package:tdd_test_app/core/utils/typedef.dart';
import 'package:tdd_test_app/src/authentication/domain/Repositories/authentication_repository.dart';
import 'package:tdd_test_app/src/authentication/domain/entities/user.dart';
import '../../../../core/usecase/usecase.dart';

class GetUsers extends UseCaseWithoutParams<List<User>> {
  GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() => _repository.getUser();
}
