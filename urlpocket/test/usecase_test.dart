import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:urlpocket/client/url_shortener_api.dart';
import 'package:urlpocket/interactor/url_interactor.dart';
import 'package:urlpocket/interactor/url_shrink_result.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/model/dto/url_shrink_dto.dart';

import 'usecase_test.mocks.dart';

final api = MockUrlShortenerApi();
final UrlUseCase interactor = UrlInteractor(api);
final dtoResponse =
    UrlShrinkDto("77561101", {"self": "urlToShrink", "short": "short.url"});

@GenerateMocks([UrlShortenerApi])
void main() {
  group('useCaseUrl', () {
    test('return a UrlShrinkResult object.', () async {
      when(api.requestShrinkUrl("urlToShrink"))
          .thenAnswer((_) async => dtoResponse);

      expect(await interactor.shrinkUrl("urlToShrink"), isA<UrlShrinkResult>());
    });

    test('return a UrlShrinkResult object with success status', () async {
      when(api.requestShrinkUrl("urlToShrink"))
          .thenAnswer((_) async => dtoResponse);

      var response = await interactor.shrinkUrl("urlToShrink");
      expect(response.status, ResultStatus.success);
    });

    test('return a UrlShrinkResult object with failure status', () async {
      when(api.requestShrinkUrl("urlToShrink")).thenThrow(Exception());

      var response = await interactor.shrinkUrl("urlToShrink");
      expect(response.status, ResultStatus.failure);
    });
  });
}
