import 'package:flutter/material.dart';
import 'package:urlpocket/model/data/url_shrink.dart';
import 'package:urlpocket/provider/url_shrink_provider.dart';

class UrlList extends StatefulWidget {
  final UrlShrinkProvider urlProvider;

  const UrlList({super.key, required this.urlProvider});

  @override
  State<UrlList> createState() => _UrlListState();
}

class _UrlListState extends State<UrlList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.urlProvider.urlList.length,
          itemBuilder: (context, index) {
            return _renderListItem(widget.urlProvider.urlList[index]);
          }),
    );
  }

  Widget _renderListItem(UrlShrink item) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(item.originalUrl),
        subtitle: Text(item.shrinkUrl),
      ),
    );
  }
}
