import 'package:regexed_validator/regexed_validator.dart';
import 'package:urlpocket/model/data/url_shrink.dart';
import 'package:urlpocket/model/dto/url_shrink_dto.dart';

//define a method that excecutes the URL validation form, but leaving the import and dependency
//outside the widget that requires the validation itself
bool validateUrl(String input) {
  return validator.url(input);
}

UrlShrink convertResponseToUrlShrink(UrlShrinkDto response) {
  return UrlShrink(response.links['self'] ?? "", response.links['short'] ?? "",
      response.alias ?? "");
}
