import 'package:flutter/gestures.dart';

import '../../Utility/utility_export.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController confPassController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
                        'Reset password?',
                        style: AppFontStyle.blackOpenSans22W600.copyWith(fontSize: 24),
                      ),
                      customHeight(8),
                      Text(
                        'You’re a step away from accessing your \naccount!',
                        style: AppFontStyle.greyOpenSans14W400,
                        textAlign: TextAlign.center,
                      ),
                      height14,
                      commonTextField(
                          labelText: 'Password',
                          hintText: '**********',
                          textEditingController: passController,
                          validationFunction: (val) {
                            return passwordValidation(val);
                          }),
                      height14,
                      commonTextField(
                          labelText: 'Confirm Password',
                          hintText: '**********',
                          textEditingController: confPassController,
                          validationFunction: (val) {
                            return passController.text == confPassController.text
                                ? null
                                : 'Password miss match';
                          }),
                      customHeight(30),
                      commonFilledButton(
                        onTap: () {
                          if (globalKey.currentState!.validate()) {
                            // Click here
                            Get.offAll(() => const LoginScreen());
                          }
                        },
                        title: 'Reset Password',
                      ),
                      height20,
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Don’t need to do this?',
                              style: AppFontStyle.blackOpenSans16W500),
                          TextSpan(
                              text: " Login",
                              style: AppFontStyle.blackOpenSans16W500.copyWith(color: colorPrimary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // your Sign Up Click here
                                  Get.offAll(() => const LoginScreen());
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
