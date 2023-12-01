import 'package:urlpocket/model/dto/url_shrink_dto.dart';

abstract class UrlApi {
  Future<UrlShrinkDto> requestShrinkUrl(String url);
}
