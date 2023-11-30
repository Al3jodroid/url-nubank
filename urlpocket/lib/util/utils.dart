import 'package:regexed_validator/regexed_validator.dart';

//define a method that excecutes the URL validation form, but leaving the import and dependency
//outside the widget that requires the validation itself
bool validateUrl(String input) {
  return validator.url(input);
}
