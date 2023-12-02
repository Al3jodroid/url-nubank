import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/provider/connectivity_provider.dart';
import 'package:urlpocket/provider/url_shrink_provider.dart';
import 'package:urlpocket/ui/home_page.dart';

class UrlPocketApp extends StatelessWidget {
  const UrlPocketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ConnectivityProvider()),
        ChangeNotifierProvider(
          create: (ctx) => UrlShrinkProvider(
            useCase: GetIt.I.get<UrlUseCase>(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'UrlPocket!',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Url Shrinker'),
      ),
    );
  }
}
