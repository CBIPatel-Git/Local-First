import 'package:fluttertoast/fluttertoast.dart';
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
  return value.toString().isEmpty
      ? "Please enter email"
      : !GetUtils.isEmail(value)
          ? "Please enter valid email address"
          : null;
}

panValidation(value) {
  return value.toString().isEmpty
      ? "Please enter PAN number"
      : value.length != 10
          ? "Please enter valid PAN number"
          : null;
}

aadhaarValidation(value) {
  return value.toString().isEmpty
      ? "Please enter aadhaar number"
      : value.length != 16
          ? "Please enter valid aadhaar number"
          : null;
}

phoneNumberValidation(value) {
  return value.toString().isEmpty
      ? "Please enter phone number"
      : value.length != 10
          ? "Please enter valid phone number"
          : null;
}

isNotEmptyValidation(value) {
  return value.toString().isEmpty ? "This field can't be empty" : null;
}

passwordValidation(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return value.toString().isEmpty
      ? 'Please enter password'
      : regExp.hasMatch(value)
          ? null
          : 'Please add strong password ex: Chintan@123';
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

double getSliverGridDelegate(BuildContext context) {
  return getScreenHeight(context) < 810
      ? 2 / 2.7
      : getScreenHeight(context) < 850
          ? 2 / 2.5
          : 2 / 2.4;
}

void showToast({required String message, Color? bgColor, Toast? toastLength}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor ?? Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}
