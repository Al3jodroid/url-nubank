import 'dart:convert';

import 'package:http/http.dart';
import 'package:urlpocket/client/url_api.dart';
import 'package:urlpocket/constants.dart';
import 'package:urlpocket/model/dto/url_shrink_dto.dart';

class UrlShortenerApi implements UrlApi {
  final Client client;

  UrlShortenerApi(this.client);

  @override
  Future<UrlShrinkDto> requestShrinkUrl(String urlToShrink) async {
    final url = Uri.https(baseURL, requestShrink);
    final bodyToSend = json.encode(<String, String>{'url': urlToShrink});
    final headersToSend = {"Content-Type": "application/json"};

    final response =
        await client.post(url, headers: headersToSend, body: bodyToSend);

    // print('Request: $url, status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      return UrlShrinkDto.fromJson(responseData);
    } else {
      throw Exception('Failed to Shrink the Url');
    }
  }
}
