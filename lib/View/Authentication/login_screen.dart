import 'package:flutter/gestures.dart';
import 'package:local_first/View/Authentication/create_account_screen.dart';
import 'package:local_first/View/Authentication/forgot_password_screen.dart';
import 'package:local_first/View/Authentication/location_access_screen.dart';

import '../../Utility/utility_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                    children: [
                      customHeight(70),
                      Center(
                        child: Column(
                          children: [
                            Image(
                              image: imagesAppLogo,
                              height: 60,
                              width: 260,
                            ),
                            customHeight(38),
                            Text(
                              'Login to your account',
                              style: AppFontStyle.blackOpenSans24W600,
                            ),
                            customHeight(8),
                            Text(
                              'Please sign in to your account ',
                              style: AppFontStyle.greyOpenSans14W500,
                            ),
                          ],
                        ),
                      ),
                      customHeight(38),
                      commonTextField(
                          labelText: 'Mobile Number',
                          hintText: '+91 98765432190',
                          textEditingController: numberController,
                          validationFunction: (val) {
                            return phoneNumberValidation(val);
                          }),
                      height14,
                      commonTextField(
                          labelText: 'Email Address',
                          hintText: 'Albertstevano@gmail.com',
                          textEditingController: emailController,
                          validationFunction: (val) {
                            return emailValidation(val);
                          }),
                      height14,
                      commonTextField(
                          labelText: 'Password',
                          hintText: '**********',
                          isPassword: true,
                          textEditingController: passController,
                          validationFunction: (val) {
                            return passwordValidation(val);
                          }),
                      height05,
                      Align(
                          alignment: Alignment.centerRight,
                          child: commonClickableText(
                            callBack: () {
                              // Forgot pass click
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            text: 'Forgot Password?',
                          )),
                      customHeight(30),
                      commonFilledButton(
                        onTap: () {
                          if (globalKey.currentState!.validate()) {
                            // Click on Sign In
                            Get.to(() => const LocationAccessScreen());
                          }
                        },
                        title: 'Sign In',
                      ),
                      customHeight(24),
                      SizedBox(
                        width: getScreenWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Divider(color: colorGrey.withOpacity(0.3), height: 1)),
                            SizedBox(
                                height: 25,
                                width: 150,
                                child: Text('Or sign in with',
                                    style: AppFontStyle.greyOpenSans14W500,
                                    textAlign: TextAlign.center)),
                            Expanded(child: Divider(color: colorGrey.withOpacity(0.3), height: 1)),
                          ],
                        ),
                      ),
                      customHeight(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonSocialButton(onTap: () {}, icon: iconsGoogle),
                          width16,
                          commonSocialButton(onTap: () {}, icon: iconsFacebook),
                        ],
                      ),
                      customHeight(24),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Don\'t have an account?',
                              style: AppFontStyle.blackOpenSans16W500),
                          TextSpan(
                              text: " Sign Up",
                              style: AppFontStyle.blackOpenSans16W500.copyWith(color: colorPrimary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // your Sign Up Click here
                                  Get.off(() => const CreateAccountScreen());
                                }),
                        ]),
                      ),
                      customHeight(30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
