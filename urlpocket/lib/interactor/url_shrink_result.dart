import 'package:urlpocket/model/data/url_shrink.dart';

enum ResultStatus { success, failure, empty }

class UrlShrinkResult {
  final ResultStatus status;
  final UrlShrink? url;

  UrlShrinkResult(this.status, this.url);
}
