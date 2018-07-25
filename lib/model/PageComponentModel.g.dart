// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PageComponentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageComponentModel _$PageComponentModelFromJson(Map<String, dynamic> json) {
  return new PageComponentModel(
      json['imgPath'] as String, json['title'] as String);
}

abstract class _$PageComponentModelSerializerMixin {
  String get imgPath;
  String get title;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'imgPath': imgPath, 'title': title};
}
