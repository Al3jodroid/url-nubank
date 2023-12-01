import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:urlpocket/interactor/url_shrink_result.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/model/data/url_shrink.dart';

class UrlShrinkProvider with ChangeNotifier {
  final List<UrlShrink> _urlList = [];
  List<UrlShrink> get urlList => _urlList;
  Function()? onFailureShrink;

  bool showLoading = false;

  void shrinkUrl(String urlToShirnk, Function() onfailure) async {
    onFailureShrink = onfailure;
    setLoadingVisible(true);
    final resultShrink = await GetIt.I.get<UrlUseCase>().shrinkUrl(urlToShirnk);
    validateResult(resultShrink);
  }

  void setLoadingVisible(bool show) {
    showLoading = show;
    notifyListeners();
  }

  void validateResult(UrlShrinkResult resultShrink) {
    if (resultShrink.status == ResultStatus.success) {
      _urlList.add(resultShrink.url!);
    } else {
      onFailureShrink?.call();
    }
    setLoadingVisible(false);
  }
}
