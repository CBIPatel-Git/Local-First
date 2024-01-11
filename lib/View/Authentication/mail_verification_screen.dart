import 'package:flutter/gestures.dart';
import 'package:local_first/View/Authentication/reset_password_screen.dart';

import '../../Utility/utility_export.dart';

class MailVerificationScreen extends StatefulWidget {
  String email;

  MailVerificationScreen({super.key, required this.email});

  @override
  State<MailVerificationScreen> createState() => _MailVerificationScreenState();
}

class _MailVerificationScreenState extends State<MailVerificationScreen> {
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
                      Center(child: Image(image: imagesMailPic)),
                      customHeight(30),
                      Text(
                        'We have sent you an email',
                        style: AppFontStyle.blackOpenSans24W600,
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
                                style:
                                AppFontStyle.greyOpenSans16W400.copyWith(color: colorPrimary2),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // your Sign Up Click here
                                  }),
                            TextSpan(
                                text: ' Then click on text.',
                                style: AppFontStyle.greyOpenSans16W400),
                          ]),
                        ),
                      ),
                      customHeight(30),
                      commonFilledButton(
                        onTap: () {
                          // if (globalKey.currentState!.validate()) {
                          //   // Click on Sign In
                          // }

                          Get.off(() => const ResetPasswordScreen());
                        },
                        title: 'Reset Password',
                      ),
                      height20,
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Didn’t receive the email yet?',
                              style: AppFontStyle.blackOpenSans16W500),
                          TextSpan(
                              text: " Send Again",
                              style: AppFontStyle.blackOpenSans16W500.copyWith(color: colorPrimary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // your Sign Up Click here
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
