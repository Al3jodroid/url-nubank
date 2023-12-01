// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_shrink_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlShrinkDto _$UrlShrinkDtoFromJson(Map<String, dynamic> json) => UrlShrinkDto(
      json['alias'] as String?,
      Map<String, String>.from(json['_links'] as Map),
    );

Map<String, dynamic> _$UrlShrinkDtoToJson(UrlShrinkDto instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      '_links': instance.links,
    };
