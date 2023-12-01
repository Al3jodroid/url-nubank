import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:urlpocket/client/url_shortener_api.dart';
import 'package:urlpocket/interactor/url_interactor.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/urlpocket_app.dart';

void main() {
  //allow to register for future injection a UrlUseCase
  //with different UrlInteractor implementations (if its required)
  GetIt.I.registerSingleton<UrlUseCase>(
    UrlInteractor(
      UrlShortenerApi(), // A "classic" way to inject a class (the api client in this case)
    ),
  );
  runApp(const UrlPocketApp());
}
