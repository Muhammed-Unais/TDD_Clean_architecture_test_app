import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_test_app/src/authentication/domain/Repositories/authentication_repository.dart';
import 'package:tdd_test_app/src/authentication/domain/usecase/create_user.dart';

import 'authentication_repository.mock.dart';

main() {
  late CreateUser useCase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUser(repository);
  });

  var params =  const CreateUserParams.empty();

  test(
    'Should call the [AuthRepo.createUser]',
    () async {
      //   1.Arrange

      //Stubbing
      when(
        () => repository.createUser(
          createdAt: any(named: "createdAt"),
          name: any(named: "name"),
          avatar: any(named: "avatar"),
        ),
      ).thenAnswer((_) async => const Right(null));

      //  2.Act
      final result = await useCase(params);

      // 3.asserts

      expect(result, equals(const Right<dynamic, void>(null)));

      verify(
        () => repository.createUser(
            createdAt: params.createdAt,
            name: params.name,
            avatar: params.avatar),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
