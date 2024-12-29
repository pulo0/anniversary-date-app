import 'package:form_field_validator/form_field_validator.dart';

class ValidatorBottomSheet {
  MultiValidator validatorName(
      String requiredTxt, String fieldCharText, int minChar) {
    return MultiValidator([
      RequiredValidator(errorText: requiredTxt),
      MinLengthValidator(minChar, errorText: fieldCharText),
    ]);
  }

  MultiValidator validatorRequire(String requireTxt) {
    return MultiValidator([
      RequiredValidator(errorText: requireTxt),
    ]);
  }
}
