import 'package:local_first/Utility/utility_export.dart';

Widget commonClickableText(
    {required Function callBack,
    required String text,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding}) {
  return InkWell(
    splashColor: white,
    highlightColor: white,
    onTap: () {
      callBack();
    },
    child: Padding(
      padding: padding ?? const EdgeInsets.all(6),
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
    padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
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

Widget commonBoxShadowContainer(
    {required Widget child,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin}) {
  return Container(
    padding: padding,
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      color: white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 12,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
    ),
    child: child,
  );
}

Widget commonCheckBoxContainer() {
  return Container(
    height: 20,
    width: 20,
    decoration:
        const BoxDecoration(color: whiteF7F7F7, borderRadius: BorderRadius.all(Radius.circular(5))),
  );
}

Widget noDataPlaceHolder() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.not_interested,
        color: Colors.grey,
      ),
      height05,
      const Text('No Data Found')
    ],
  );
}
