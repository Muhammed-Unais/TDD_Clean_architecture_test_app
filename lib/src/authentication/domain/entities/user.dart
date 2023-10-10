import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id];
}
