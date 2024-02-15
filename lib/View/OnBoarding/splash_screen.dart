import 'dart:async';

import 'package:local_first/View/OnBoarding/on_boarding_screen.dart';

import '../../Utility/utility_export.dart';
import '../Dashboard/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (getIsLogin()) {
        Get.offAll(() => const BottomNavigationScreen());
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
