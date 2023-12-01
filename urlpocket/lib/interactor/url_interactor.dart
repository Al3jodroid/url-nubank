import 'package:urlpocket/client/url_api.dart';
import 'package:urlpocket/interactor/url_shrink_result.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/util/utils.dart';

class UrlInteractor implements UrlUseCase {
  final UrlApi urlApi;
  const UrlInteractor(this.urlApi);

  @override
  Future<UrlShrinkResult> shrinkUrl(String url) async {
    final resultDto = await urlApi.requestShrinkUrl(url);
    try {
      if (resultDto != null) {
        var response = convertResponseToUrlShrink(resultDto);
        return UrlShrinkResult(ResultStatus.success, response);
      } else {
        return UrlShrinkResult(ResultStatus.failure, null);
      }
    } catch (e) {
      return UrlShrinkResult(ResultStatus.failure, null);
    }
  }
}
