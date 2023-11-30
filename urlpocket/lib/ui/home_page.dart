import 'package:flutter/material.dart';
import 'package:urlpocket/ui/connectivity_widget.dart';
import 'package:urlpocket/ui/url_shirk_form.dart';
import 'package:urlpocket/util/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            const ConnectivityWidget(),
            UrlShrinkForm(
              onClickShrinkUrl: _askToShrinkUrl,
              validateUrl: validateUrl,
            )
          ],
        ),
      ),
    );
  }

  _askToShrinkUrl(String url) {}
}
