import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:urlpocket/provider/connectivity_provider.dart';
import 'package:urlpocket/provider/url_cubit.dart';
import 'package:urlpocket/ui/home_page.dart';

class UrlPocketApp extends StatelessWidget {
  const UrlPocketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //"classic" definition of notification provider
        ChangeNotifierProvider(create: (ctx) => ConnectivityProvider()),
        //cubit's provider, more fun to write :)
        BlocProvider<UrlCubit>(create: (context) => UrlCubit()),
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
