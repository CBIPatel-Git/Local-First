import 'dart:ffi';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:local_first/Utility/utility_export.dart';
import 'package:pinput/pinput.dart';

import '../API/api_config.dart';
import '../Controller/authentication_controller.dart';

getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

showSnackBar(
    {String title = appName, required String message, MaterialColor? color, int? duration}) {
  return Get.snackbar(
    title, // title
    message, // message
    backgroundColor: color ??
        (title.isEmpty || title == ApiConfig.warning
            ? const Color(0xffFFCC00)
            : title == ApiConfig.success || title == appName
                ? Colors.green
                : Colors.red),
    colorText: title.isEmpty || title == ApiConfig.warning ? Colors.black : Colors.white,
    icon: Icon(
      title.isEmpty || title == ApiConfig.warning
          ? Icons.warning_amber_outlined
          : title == ApiConfig.success
              ? Icons.check_circle
              : Icons.error,
      color: title.isEmpty || title == ApiConfig.warning ? Colors.black : Colors.white,
    ),
    onTap: (_) {},
    shouldIconPulse: true,
    barBlur: 10,
    isDismissible: true,
    duration: Duration(seconds: duration ?? 2),
  );
}

printLog(dynamic str) {
  return print('Log $str');
}

printModelLog(dynamic str) {
  return print('Model Mismatch Log == $str');
}


setIsLogin({required bool isLogin}) {
  return getPreference.write(PrefConstants.isLoginPref, isLogin);
}

bool getIsLogin() {
  return (getPreference.read(PrefConstants.isLoginPref) ?? false);
}

setLoginAccessToken({required String loginToken}) {
  return getPreference.write(PrefConstants.loginTokenPref, loginToken);
}

getLoginAccessToken() {
  return getPreference.read(PrefConstants.loginTokenPref);
}

setResponse({required String key, required String loginToken}) {
  return getPreference.write(key, loginToken);
}

getResponse({required String key}) {
  return getPreference.read(key);
}

setSelectedLocationLat({required double lat}) {
  return getPreference.write(PrefConstants.selectedLocationLatPref, lat);
}

getSelectedLocationLat() {
  return getPreference.read(PrefConstants.selectedLocationLatPref);
}

setSelectedLocationLng({required double lng}) {
  return getPreference.write(PrefConstants.selectedLocationLngPref, lng);
}

getSelectedLocationLng() {
  return getPreference.read(PrefConstants.selectedLocationLngPref);
}

setUserId({required num userId}) {
  return getPreference.write(PrefConstants.userIdPref, userId);
}

getUserId() {
  return getPreference.read(PrefConstants.userIdPref);
}

isNotEmptyString(String? data) {
  return data != null && data.isNotEmpty;
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

disableFocusScopeNode(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

dateFormat({required DateTime date}) {
  String formatDate = '';
  try {
    formatDate = DateFormat('dd-MMM-yyyy').format(date);
  } catch (e) {
    printLog('date format :: $e');
  }
  return formatDate;
}

dateFormatter(String? dateTime, {String? myFormat, String? inputFormat}) {
  final DateTime now = DateTime.now();

  if (dateTime == null || dateTime == 'null' || dateTime == '-') {
    return '-';
  } else {
    /// Your date format
    final DateFormat formatter = DateFormat(myFormat ?? 'MM/dd/yyyy');
    final String formatted;
    if (isNotEmptyString(dateTime)) {
      // 'yyyy-MM-dd'
      formatted = formatter.format(DateFormat(inputFormat ?? 'yyyy-MM-dd').parse(dateTime));
    } else {
      formatted = 'Date';
      // formatted = formatter.format(now);
    }
    return formatted;
  }
}

numFormatter(num numbersValue, {int? considerNumber}) {
  return numbersValue.toStringAsFixed(considerNumber ?? 1);
}

// Future userDatePicker({required BuildContext context, required RxBool userDobSelected}) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext contextTwo) {
//       return Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         elevation: 15,
//         child: SizedBox(
//           height: 325,
//           width: 300,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 250,
//                 width: 250,
//                 child: SfDateRangePicker(
//                   maxDate: maxDate,
//                   // initialDisplayDate: DateTime(1998,12,09),
//                   // initialSelectedDate: DateTime(1998,12,09),
//                   onSelectionChanged: _onSelectionChanged,
//                   selectionMode: DateRangePickerSelectionMode.single,
//                   initialSelectedRange: PickerDateRange(
//                       DateTime.now().subtract(const Duration(days: 4)),
//                       DateTime.now().add(const Duration(days: 3))),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: commonFillButtonView(
//                     title: 'Select',
//                     tapOnButton: () {
//                       userDobSelected.value = true;
//                       Get.back(result: userBobSelectedDate.value);
//                     }),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
