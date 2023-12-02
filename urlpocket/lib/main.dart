import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:urlpocket/client/url_api.dart';
import 'package:urlpocket/client/url_shortener_api.dart';
import 'package:urlpocket/interactor/url_interactor.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/urlpocket_app.dart';

void main() {
  //allow to register for future injection a UrlApi implementations
  GetIt.I.registerSingleton<UrlApi>(UrlShortenerApi(Client()));
  //allow to register for future injection of a UrlUseCase implementation
  GetIt.I.registerSingleton<UrlUseCase>(UrlInteractor(GetIt.I.get<UrlApi>()));
  runApp(const UrlPocketApp());
}
