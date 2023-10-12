import 'package:equatable/equatable.dart';
import 'package:tdd_test_app/core/utils/typedef.dart';
import 'package:tdd_test_app/src/authentication/domain/Repositories/authentication_repository.dart';
import '../../../../core/usecase/usecase.dart';

class CreateUser implements UseCaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

 const CreateUserParams.empty()
      : this(
          createdAt: "_empty.createdAt",
          name: "_empty.name",
          avatar: "_empty.avatar"
        );

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
