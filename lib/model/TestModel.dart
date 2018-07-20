import 'package:json_annotation/json_annotation.dart';

part 'TestModel.g.dart';

@JsonSerializable()

class TestModel  extends Object with _$TestModelSerializerMixin{
  TestModel({this.origin});

  String origin;

  factory TestModel.fromJson(Map<String, dynamic> json) => _$TestModelFromJson(json);
}