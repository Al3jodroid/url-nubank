import 'package:json_annotation/json_annotation.dart';
part 'url_shrink_dto.g.dart';
//run this in console for generate the file .g.dart: "flutter pub run build_runner build"

@JsonSerializable()
class UrlShrinkDto {
  final String? alias;
  @JsonKey(name: '_links')
  final Map<String, String> links;

  UrlShrinkDto(this.alias, this.links);

  factory UrlShrinkDto.fromJson(Map<String, dynamic> json) =>
      _$UrlShrinkDtoFromJson(json);
}
