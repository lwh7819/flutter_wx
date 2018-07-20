import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()

class User extends Object with _$UserSerializerMixin {
  User(this.name, this.email);

  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}