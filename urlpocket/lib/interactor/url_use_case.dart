import 'package:urlpocket/interactor/url_shrink_result.dart';

abstract class UrlUseCase {
  Future<UrlShrinkResult> shrinkUrl(String url);
}
