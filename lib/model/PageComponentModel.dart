import 'package:json_annotation/json_annotation.dart';

part 'PageComponentModel.g.dart';

@JsonSerializable()

class PageComponentModel extends Object with _$PageComponentModelSerializerMixin {
  PageComponentModel(this.imgPath, this.title);

  String imgPath;
  String title;

  factory PageComponentModel.fromJson(Map<String, dynamic> json) => _$PageComponentModelFromJson(json);
}