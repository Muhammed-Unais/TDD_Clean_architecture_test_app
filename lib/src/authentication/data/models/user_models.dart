import 'dart:convert';

import 'package:tdd_test_app/core/utils/typedef.dart';
import 'package:tdd_test_app/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.createdAt,
    required super.avatar,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap dataMap)
      : this(
          id: dataMap["id"] as String,
          name: dataMap["name"] as String,
          avatar: dataMap["avatar"] as String,
          createdAt: dataMap["createdAt"] as String,
        );

  UserModel copyWith(
      {String? name, String? avatar, String? createdAt, String? id}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      avatar: avatar ?? this.avatar,
    );
  }

  const UserModel.empty()
      : this(
          id: "1",
          createdAt: "_empty.createdAt",
          avatar: "_empty.avatar",
          name: "_empty.name",
        );

  DataMap toMap() => {
        "createdAt": createdAt,
        "name": name,
        "avatar": avatar,
        "id": id,
      };

  String toJson() => jsonEncode(toMap());
}
