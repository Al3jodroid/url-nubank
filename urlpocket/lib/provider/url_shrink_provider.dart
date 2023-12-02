import 'package:flutter/material.dart';
import 'package:urlpocket/interactor/url_shrink_result.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/model/data/url_shrink.dart';

class UrlShrinkProvider with ChangeNotifier {
  UrlShrinkProvider({required this.useCase});

  final UrlUseCase useCase;
  final List<UrlShrink> urlList = [];
  Function()? onFailureShrink;

  bool showLoading = false;

  Future<void> shrinkUrl(String urlToShirnk, Function() onfailure) async {
    onFailureShrink = onfailure;
    setLoadingVisible(true);
    final resultShrink = await useCase.shrinkUrl(urlToShirnk);
    validateResult(resultShrink);
  }

  void setLoadingVisible(bool show) {
    showLoading = show;
    notifyListeners();
  }

  void validateResult(UrlShrinkResult resultShrink) {
    if (resultShrink.status == ResultStatus.success) {
      urlList.add(resultShrink.url!);
    } else {
      onFailureShrink?.call();
    }
    setLoadingVisible(false);
  }
}
