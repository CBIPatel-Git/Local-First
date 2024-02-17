import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:local_first/View/Authentication/login_screen.dart';

import '../../Utility/utility_export.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  RxBool isChecked = true.obs;

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
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Create your new account',
                                style: AppFontStyle.blackOpenSans24W600,
                              ),
                              customHeight(8),
                              Text(
                                'Create an account to start looking for the \nfood you like',
                                style: AppFontStyle.greyOpenSans14W500,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      customHeight(38),
                      commonTextField(
                          labelText: 'Mobile Number',
                          hintText: '+91 98765432190',
                          textEditingController: numberController,
                          keyboardType: TextInputType.number,
                          validationFunction: (val) {
                            return phoneNumberValidation(val);
                          }),
                      height14,
                      commonTextField(
                          labelText: 'Email Address',
                          hintText: 'Albertstevano@gmail.com',
                          textEditingController: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validationFunction: (val) {
                            return emailValidation(val);
                          }),
                      height14,
                      commonTextField(
                          labelText: 'Enter Name',
                          hintText: 'John Wick',
                          textEditingController: nameController,
                          validationFunction: (val) {
                            return isNotEmptyValidation(val);
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
                      height14,
                      commonTextField(
                          labelText: 'Confirm Password',
                          hintText: '**********',
                          isPassword: true,
                          textEditingController: confPassController,
                          validationFunction: (val) {
                            return passwordValidation(val);
                          }),
                      height05,
                      Row(
                        children: [
                          Obx(() {
                            return CupertinoCheckbox(
                                value: isChecked.value,
                                activeColor: colorPrimary,
                                onChanged: (val) {
                                  isChecked.value = val ?? false;
                                });
                          }),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'I Agree with', style: AppFontStyle.greyOpenSans12W600),
                              TextSpan(
                                  text: " Terms of Service ",
                                  style:
                                  AppFontStyle.greyOpenSans12W600.copyWith(color: colorPrimary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // your Terms of Service here
                                      printLog('your Terms of Service Click here');
                                    }),
                              TextSpan(text: 'and', style: AppFontStyle.greyOpenSans12W600),
                              TextSpan(
                                  text: " Privacy Policy",
                                  style:
                                  AppFontStyle.greyOpenSans12W600.copyWith(color: colorPrimary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // your Privacy Policy Click here
                                      printLog('your Privacy Policy Click here');
                                    }),
                            ]),
                          ),
                        ],
                      ),
                      customHeight(30),
                      commonFilledButton(
                        onTap: () {
                          // if (globalKey.currentState!.validate()) {
                          //   // Click on Sign Up
                          // }
                          disableFocusScopeNode(context);
                          // Your Click
                          if (globalKey.currentState?.validate() == true) {
                            Map<String, dynamic> params = {
                              "user_nicename": nameController.text,
                              "user_email": emailController.text,
                              "user_pass": passController.text,
                              "user_pass_confirmation": confPassController.text,
                            };
                            kAuthenticationController.signUpAuthenticationAPICall(params, () {
                              Get.to(() => const LoginScreen());
                            });
                          }
                        },
                        title: 'Sign Up',
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
                              text: 'Already have an account?',
                              style: AppFontStyle.blackOpenSans16W500),
                          TextSpan(
                              text: " Sign In",
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
              ),
            ],
          ),
        ));
  }
}
