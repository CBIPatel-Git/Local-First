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
