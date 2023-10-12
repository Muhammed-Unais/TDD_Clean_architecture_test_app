import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_test_app/src/authentication/domain/Repositories/authentication_repository.dart';
import 'package:tdd_test_app/src/authentication/domain/entities/user.dart';
import 'package:tdd_test_app/src/authentication/domain/usecase/get_user.dart';

import 'authentication_repository.mock.dart';

main() {
  late AuthenticationRepository repository;
  late GetUsers useCase;

  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test("should call [AuthRepo.getUsers] and return List<User>", () async {
    when(() => repository.getUser()).thenAnswer(
      (_) async => const Right(tResponse),
    );

    final result =await useCase();

    expect(result, equals(const Right<dynamic,List<User>>(tResponse)));

    verify(()=>repository.getUser()).called(1);

    verifyNoMoreInteractions(repository);
  });
}
