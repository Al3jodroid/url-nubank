import 'package:urlpocket/client/url_api.dart';
import 'package:urlpocket/interactor/url_shrink_result.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/util/utils.dart';

class UrlInteractor implements UrlUseCase {
  final UrlApi urlApi;
  const UrlInteractor(this.urlApi);

  @override
  Future<UrlShrinkResult> shrinkUrl(String url) async {
    try {
      final resultDto = await urlApi.requestShrinkUrl(url);
      var response = convertResponseToUrlShrink(resultDto);
      return UrlShrinkResult(ResultStatus.success, response);
    } catch (e) {
      return UrlShrinkResult(ResultStatus.failure, null);
    }
  }
}
