import '../../Utility/utility_export.dart';
import '../Authentication/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> titles = [
    'Welcome to \nLocalFirst',
    'Fast and Reliable \nDelivery',
    'Seamless Checkout, \nSecure Payments'
  ];
  List<String> descriptions = [
    'Discover a world of convenience and endless possibilities. Get ready to embark on a seamless shopping experience tailored just for you.',
    'Experience swift and dependable delivery services. Track your orders in real-time and receive updates every step of the way."',
    'Your financial security is our top priority. All transactions are encrypted and processed through secure channels to protect your sensitive information."'
  ];
  List<ExactAssetImage> images = [imagesOnBoarding1, imagesOnBoarding2, imagesOnBoarding3];

  RxInt selectedIndex = 0.obs;

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
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      titles[selectedIndex.value],
                      textAlign: TextAlign.center,
                      style: AppFontStyle.blackWorkSans28W600,
                    ),
                    Image(
                      image: images[selectedIndex.value],
                      fit: BoxFit.fitWidth,
                      width: 326,
                      height: 271,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 33),
                      child: Text(
                        descriptions[selectedIndex.value],
                        style: AppFontStyle.greyWorkSans14W400,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Skip',
                          style: AppFontStyle.blackWorkSans16W400.copyWith(color: lightOrange),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          if (selectedIndex.value == 2) {
                            Get.offAll(() => const LoginScreen());
                          } else {
                            selectedIndex.value = selectedIndex.value + 1;
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: colorPrimary),
                        child: Text(
                          'Skip',
                          style: AppFontStyle.blackWorkSans16W400.copyWith(color: white),
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
