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

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customHeight(56),
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
                        style: AppFontStyle.blackWorkSans22W600,
                      ),
                      customHeight(8),
                      Text(
                        'Please sign in to your account ',
                        style: AppFontStyle.greyWorkSans14W500,
                      ),
                      commonTextField(
                        hintText: '+91 98765432190',
                        labelText: 'Mobile Number',
                        textEditingController: numberController,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
