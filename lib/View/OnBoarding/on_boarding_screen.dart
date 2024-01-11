import 'package:local_first/Controller/authentication_controller.dart';

import '../../Utility/utility_export.dart';
import '../Authentication/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<ExactAssetImage> images = [
    imagesOnBoarding1,
    imagesOnBoarding2,
    imagesOnBoarding3
  ];
  int _currentIndex = 0;
  PageController pageController = PageController();

  createCircle({required int index}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.only(right: 4),
        height: 5,
        width: _currentIndex == index ? 15 : 5,
        // current indicator is wider
        decoration: BoxDecoration(
            color: _currentIndex == index
                ? colorPrimary
                : colorPrimary.withOpacity(0.7),
            borderRadius: BorderRadius.circular(3)));
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
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  SizedBox(
                    height: getScreenHeight(context) - 100,
                    width: getScreenWidth(context),
                    child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            _currentIndex = value;
                          });
                        },
                        children: kAuthenticationController.titles.map((e) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  kAuthenticationController
                                      .titles[_currentIndex],
                                  textAlign: TextAlign.center,
                                  style: AppFontStyle.blackOpenSans22W700
                                      .copyWith(fontSize: 26),
                                ),
                                Image(
                                  image: images[_currentIndex],
                                  fit: BoxFit.fitWidth,
                                  width: 326,
                                  height: 271,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 33),
                                  child: Text(
                                    kAuthenticationController
                                        .descriptions[_currentIndex],
                                    style: AppFontStyle.greyOpenSans14W400,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
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
                    if (_currentIndex != 2)
                      TextButton(
                          onPressed: () {
                            pageController.jumpToPage(2);
                          },
                          child: Text(
                            'Skip',
                            style: AppFontStyle.blackOpenSans16W400
                                .copyWith(color: lightOrange),
                          )),
                    if (_currentIndex != 2)
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                kAuthenticationController.titles.length,
                                (index) => createCircle(index: index)),
                          )),
                    _currentIndex == 2
                        ? Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: commonFilledButton(
                                onTap: () {
                                  Get.offAll(() => const LoginScreen());
                                },
                                title: 'Let’s Get Started',
                              ),
                            ),
                          )
                        : SizedBox(
                            width: 98,
                            child: commonFilledButton(
                              onTap: () {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              title: 'Next',
                            ),
                          ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class ExplanationData {
  final String title;
  final String description;
  final ExactAssetImage localImageSrc;

  ExplanationData({
    required this.title,
    required this.description,
    required this.localImageSrc,
  });
}
