import 'dart:async';
import 'dart:convert';

import 'package:local_first/View/OnBoarding/on_boarding_screen.dart';

import '../../Models/AuthenticationModel/log_in_model.dart';
import '../../Utility/utility_export.dart';
import '../../VendorFlow/Dashboard/vdashboard_screen.dart';
import '../Dashboard/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (getIsLogin()) {
        try {
          String res = getResponse(key: PrefConstants.userDataModelPref);
          kAuthenticationController.logInModel = LogInModel.fromJson(jsonDecode(res));
          Get.offAll(() => const BottomNavigationScreen());
        } catch (e) {
          printLog(e);
        }
      } else {
        Get.off(() => const OnBoardingScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Stack(
          children: [
            Image(
              image: imagesBg,
              fit: BoxFit.cover,
              width: getScreenWidth(context),
              height: getScreenHeight(context),
            ),
            Container(
              width: getScreenWidth(context),
              height: getScreenHeight(context),
              color: white.withOpacity(0.4),
            ),
            Center(
              child: Image(
                image: imagesAppLogo,
                fit: BoxFit.cover,
                width: 260,
                height: 60,
              ),
            ),
          ],
        ));
  }
}
