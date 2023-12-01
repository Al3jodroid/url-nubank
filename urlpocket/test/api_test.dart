import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:urlpocket/client/url_api.dart';
import 'package:urlpocket/client/url_shortener_api.dart';
import 'package:urlpocket/constants.dart';
import 'package:urlpocket/model/dto/url_shrink_dto.dart';
import 'api_test.mocks.dart';

//configuration of the mock client for testing the api that consume the service
final client = MockClient();
// apply the definition of the interface contract
final UrlApi api = UrlShortenerApi(client);
//the json file container of the info required to mock the return
final file = File('test/data.json');

@GenerateMocks([http.Client])
void main() {
  //values to use in the client for config/query info
  final url = Uri.https(baseURL, requestShrink);
  final bodyToSend = json.encode(<String, String>{'url': "urlToShrink"});
  final headersToSend = {"Content-Type": "application/json"};

  group("shrinkUrl", () {
    test("return a UrlShrinkDto object succesfully", () async {
      final responseData = await file.readAsString();
      when(client.post(url, headers: headersToSend, body: bodyToSend))
          .thenAnswer((_) async => http.Response(responseData, 200));

      expect(await api.requestShrinkUrl("urlToShrink"), isA<UrlShrinkDto>());
    });

    test("throws an exception from a server error", () async {
      when(client.post(url, headers: headersToSend, body: bodyToSend))
          .thenAnswer((_) async => http.Response("", 404));

      expect(api.requestShrinkUrl("urlToShrink"), throwsException);
    });
  });
}
