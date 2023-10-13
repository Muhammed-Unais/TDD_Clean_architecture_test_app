
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_test_app/core/utils/typedef.dart';
import 'package:tdd_test_app/src/authentication/data/models/user_models.dart';
import 'package:tdd_test_app/src/authentication/domain/entities/user.dart';
import '../../../../fixtures/fixture_reader.dart';

main() {

  const tModel =UserModel.empty();
  
  test("Should be a subclass of [User] entity", () {

    //Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixtures("user.json");
  final tMap =jsonDecode(tJson) as DataMap;

  group("fromMap", () {
    test("should return a [UserModel] with the right data", () {

    //  Act
      final result =UserModel.fromMap(tMap);
    //  assert
      expect(result, equals(tModel));
    });
  });

  group("fromJson", () {
    test("should return a [UserModel] with the right data", () {

      //  Act
      final result =UserModel.fromJson(tJson);
      //  assert
      expect(result, equals(tModel));
    });
  });
  
  group("toMap", () { 
    test("should return a [Map] with the right data", () {
      //Act
      final result = tModel.toMap();
      //Assert
      expect(result, equals(tMap));
    });
  });

  group("toJson", () {
    test("should return a [Json] string with the right data", () {
      //Arrange
      final tJson =jsonEncode({
        "createdAt": "_empty.createdAt",
        "name": "_empty.name",
        "avatar": "_empty.avatar",
        "id": "1"
      });
      //Act
      final result = tModel.toJson();
      //Assert
      expect(result, equals(tJson));
    });
  });
  
  group("copyWith", () {
    test("should be return a [UserModel] with different data", (){

    //Act

      final result =tModel.copyWith(name: "Unais");

      // Assert
      expect(result.name, equals("Unais"));
    });
  });
}