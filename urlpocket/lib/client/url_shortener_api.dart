import 'dart:convert';

import 'package:urlpocket/client/url_api.dart';
import 'package:urlpocket/constants.dart';
import 'package:urlpocket/model/dto/url_shrink_dto.dart';
import "package:http/http.dart" as http;

class UrlShortenerApi implements UrlApi {
  @override
  Future<UrlShrinkDto?> requestShrinkUrl(String urlToShrink) async {
    try {
      final url = Uri.https(baseURL, requestShrink);
      final bodyToSend = json.encode(<String, String>{'url': urlToShrink});
      final headersToSend = {"Content-Type": "application/json"};

      final response = await http.post(
        url,
        headers: headersToSend,
        body: bodyToSend,
      );

      print('Request: $url, status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = json.decode(response.body);
      return UrlShrinkDto.fromJson(responseData);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
