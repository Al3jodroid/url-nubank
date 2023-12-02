import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:urlpocket/interactor/url_interactor.dart';
import 'package:urlpocket/interactor/url_shrink_result.dart';
import 'package:urlpocket/model/data/url_shrink.dart';
import 'package:urlpocket/provider/url_shrink_provider.dart';

import 'provider_test.mocks.dart';

@GenerateMocks([UrlInteractor])
void main() {
  late MockUrlInteractor mockUrlInteractor;
  late UrlShrinkProvider urlShrinkProvider;
  int listenCount = 0;

  setUp(() {
    listenCount = 0;
    mockUrlInteractor = MockUrlInteractor();
    urlShrinkProvider = UrlShrinkProvider(useCase: mockUrlInteractor)
      ..addListener(() {
        listenCount++;
      });
  });

  final urlShirnkSuccess = UrlShrinkResult(
      ResultStatus.success, UrlShrink("urlToShrink", "url.shrink", "77561101"));

  final urlShirnkFailure = UrlShrinkResult(
      ResultStatus.failure, UrlShrink("urlToShrink", "url.shrink", "77561101"));

  test(
    "store UrlShrink in internal list, and notify 2 times (loading visivility, list update)",
    () async {
      when(mockUrlInteractor.shrinkUrl("urlToShirnk"))
          .thenAnswer((_) async => urlShirnkSuccess);

      await urlShrinkProvider.shrinkUrl("urlToShirnk", () => null);

      expect(urlShrinkProvider.urlList.length, 1);
      expect(listenCount, equals(2));
    },
  );

  test(
    "if fails donf update list, call notify 2 times (loading) and excecute failCallCount 1 time",
    () async {
      when(mockUrlInteractor.shrinkUrl("urlToShirnk"))
          .thenAnswer((_) async => urlShirnkFailure);

      int failCallCount = 0;
      await urlShrinkProvider.shrinkUrl("urlToShirnk", () => {failCallCount++});

      expect(urlShrinkProvider.urlList.length, 0);
      expect(listenCount, equals(2));
      expect(failCallCount, equals(1));
    },
  );
}
