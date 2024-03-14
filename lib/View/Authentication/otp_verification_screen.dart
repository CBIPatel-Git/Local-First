import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:local_first/View/Authentication/login_screen.dart';
import 'package:pinput/pinput.dart';
import 'dart:math' as math;

import '../../Utility/utility_export.dart';

class OtpVerificationScreen extends StatefulWidget {
  String email;

  OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  RxInt counter = 10.obs;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startCounter();
  }

  void startCounter() {
    try {
      counter.value = 10;
      timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
        // Timer.periodic runs every 100 ms and updates the state
        if (0 < counter.value) {
          counter.value--;
        } else {
          timer.cancel();
        }
      });
    } catch (e) {
      printLog(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Stack(
          children: [
            Image(
              image: imagesBg1,
              fit: BoxFit.cover,
              width: getScreenWidth(context),
              height: getScreenHeight(context),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customHeight(111),
                    Center(child: Image(image: imagesVerify)),
                    customHeight(51),
                    Text(
                      'OTP Verification',
                      style: AppFontStyle.blackOpenSans22W600.copyWith(fontSize: 24),
                    ),
                    customHeight(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Click on the email verification link sent to you on',
                            style: AppFontStyle.greyOpenSans16W400,
                          ),
                          TextSpan(
                              text: " ${widget.email}\n",
                              style: AppFontStyle.greyOpenSans16W400.copyWith(color: colorPrimary2),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // your Sign Up Click here
                                }),
                          TextSpan(
                              text: ' Then click on text.', style: AppFontStyle.greyOpenSans16W400),
                        ]),
                      ),
                    ),
                    customHeight(27),
                    Directionality(
                      // Specify direction if desired
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        controller: pinController,
                        focusNode: focusNode,
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        // validator: (value) {
                        //   return value == '2222' ? null : 'Pin is incorrect';
                        // },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: colorPrimaryDark,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: colorPrimaryDark),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: colorPrimary,
                            borderRadius: BorderRadius.circular(19),
                            border: Border.all(color: colorPrimaryDark),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    height20,
                    Obx(() {
                      return Text(counter.value == 0 ? '' : '00 : ${counter.value} Sec');
                    }),
                    customHeight(16),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Don’t receive code ?', style: AppFontStyle.blackOpenSans16W500),
                        TextSpan(
                            text: " Re-send",
                            style: AppFontStyle.blackOpenSans16W500.copyWith(color: colorPrimary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // your Sand Again Click here

                                startCounter();
                                // Map<String, dynamic> params = {
                                //   "user_email": widget.email,
                                // };
                                // kAuthenticationController.forgotPassApiCall(params, () {
                                //
                                // });
                              }),
                      ]),
                    ),
                    customHeight(30),
                    Obx(() {
                      return commonFilledButton(
                        bgColor: counter.value == 0 ? colorAccent : colorLightGrey,
                        onTap: () {
                          if (counter.value == 0) {
                            Map<String, dynamic> params = {
                              "otp": pinController.text,
                              "user_email": widget.email,
                            };
                            kAuthenticationController.submitOtpApiCall(params, () {
                              Get.to(() => const LoginScreen());
                            });
                          }
                        },
                        title: 'Submit',
                      );
                    }),
                    customHeight(30),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
