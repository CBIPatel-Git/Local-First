import 'package:local_first/Utility/utility_export.dart';

Widget commonClickableText(
    {required Function callBack, required String text, TextStyle? textStyle}) {
  return InkWell(
    splashColor: white,
    highlightColor: white,
    onTap: () {
      callBack();
    },
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Text(
        text,
        style: textStyle ?? AppFontStyle.greyOpenSans14W500,
      ),
    ),
  );
}

Widget commonAppBar({
  required Widget preFix,
  required Widget title,
  required Widget sufFix,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        preFix,
        title,
        sufFix,
      ],
    ),
  );
}

customIndicator({required int currentIndex, required int index}) {
  return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 4),
      height: 5,
      width: currentIndex == index ? 15 : 5,
      // current indicator is wider
      decoration: BoxDecoration(
          color: currentIndex == index ? colorPrimary : colorGrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(3)));
}

customRoundIndicator({required int currentIndex, required int index}) {
  return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 4),
      height: 5,
      width: 5,
      // current indicator is wider
      decoration: BoxDecoration(
          color: currentIndex == index ? colorPrimary : colorGrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(3)));
}

