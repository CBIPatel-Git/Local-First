import 'package:flutter/gestures.dart';
import 'package:local_first/View/Authentication/login_screen.dart';
import 'package:local_first/View/Authentication/otp_verification_screen.dart';

import '../../Utility/utility_export.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Form(
          key: globalKey,
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
                      customHeight(160),
                      Center(child: Image(image: imagesPasswordPic)),
                      customHeight(30),
                      Text(
                        'Forgot your password?',
                        style: AppFontStyle.blackOpenSans24W600,
                      ),
                      customHeight(8),
                      Text(
                        'Enter your registered email below to receive password reset instruction',
                        style: AppFontStyle.greyOpenSans14W400,
                        textAlign: TextAlign.center,
                      ),
                      height14,
                      commonTextField(
                          labelText: 'Email Address',
                          hintText: 'Albertstevano@gmail.com',
                          textEditingController: emailController,
                          validationFunction: (val) {
                            return emailValidation(val);
                          }),
                      customHeight(30),
                      commonFilledButton(
                        onTap: () {
                          if (globalKey.currentState!.validate()) {
                            // Click on Sign In
                            Map<String, dynamic> params = {
                              "user_email": emailController.text,
                            };
                            kAuthenticationController.forgotPassApiCall(params, () {
                              // Get.off(() => MailVerificationScreen(email: emailController.text));
                              Get.off(() => OtpVerificationScreen(email: emailController.text));
                            });
                          }
                        },
                        title: 'Send',
                      ),
                      height20,
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Remember passwords?', style: AppFontStyle.blackOpenSans16W500),
                          TextSpan(
                              text: " Login",
                              style: AppFontStyle.blackOpenSans16W500.copyWith(color: colorPrimary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // your Sign Up Click here
                                  Get.off(() => const LoginScreen());
                                }),
                        ]),
                      ),
                      customHeight(30),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
