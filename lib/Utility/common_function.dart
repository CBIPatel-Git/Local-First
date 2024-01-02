import 'package:local_first/Utility/utility_export.dart';
import 'package:pinput/pinput.dart';



getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

hideKeyboard(BuildContext context) {
  return FocusScope.of(context).unfocus();
}

emailValidation(value) {
  return value
      .toString()
      .isEmpty
      ? "Please enter email"
      : !GetUtils.isEmail(value)
      ? "Please enter valid email address"
      : null;
}

panValidation(value) {
  return value
      .toString()
      .isEmpty
      ? "Please enter PAN number"
      : value.length != 10
      ? "Please enter valid PAN number"
      : null;
}

aadhaarValidation(value) {
  return value
      .toString()
      .isEmpty
      ? "Please enter aadhaar number"
      : value.length != 16
      ? "Please enter valid aadhaar number"
      : null;
}

phoneNumberValidation(value) {
  return value
      .toString()
      .isEmpty
      ? "Please enter phone number"
      : value.length != 10
      ? "Please enter valid phone number"
      : null;
}

isNotEmptyValidation(value) {
  return value
      .toString()
      .isEmpty
      ? "This field can't be empty"
      : null;
}

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      color: offWhite,
      borderRadius: BorderRadius.circular(10),
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: colorPrimary),
    borderRadius: BorderRadius.circular(8),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: colorPrimary,
    ),
  );
