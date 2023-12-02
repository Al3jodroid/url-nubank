import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urlpocket/provider/url_shrink_provider.dart';
import 'package:urlpocket/ui/url_list.dart';
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
    UrlShrinkProvider urlShrinkProvider =
        Provider.of<UrlShrinkProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            UrlShrinkForm(
              onClickShrinkUrl: _askToShrinkUrl,
              validateUrl: validateUrl,
            ),
            _renderOrnNotLoadingState(urlShrinkProvider),
            _renderListResult(urlShrinkProvider)
          ],
        ),
      ),
    );
  }

  _askToShrinkUrl(String url) {
    Provider.of<UrlShrinkProvider>(context, listen: false)
        .shrinkUrl(url, _onfailure);
  }

  _onfailure() {
    const snackBar = SnackBar(
      content: Text('The last URL cant be shrinked, try again in a moment.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _renderListResult(UrlShrinkProvider urlShrinkProvider) {
    if (urlShrinkProvider.urlList.isNotEmpty) {
      return UrlList(urlProvider: urlShrinkProvider);
    } else {
      return _renderInitialState();
    }
  }

  Widget _renderInitialState() {
    return const Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.announcement),
          Text("There is no history of Url shrinked."),
        ],
      ),
    );
  }

  Widget _renderOrnNotLoadingState(UrlShrinkProvider urlShrinkProvider) {
    return Visibility(
      visible: urlShrinkProvider.showLoading,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                strokeWidth: 3,
              ),
            ),
            const SizedBox(width: 16),
            const Text("Shrinking Url..."),
          ],
        ),
      ),
    );
  }
}
