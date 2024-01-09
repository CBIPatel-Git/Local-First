import 'package:local_first/Utility/utility_export.dart';

Widget commonFilledButton(
    {required Function onTap,
    required String title,
    Color? bgColor,
    Color? titleColor,
    TextStyle? textStyle}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: bgColor ?? colorAccent,
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: bgColor?.withOpacity(0.0) ?? colorAccent.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ]),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: textStyle ?? AppFontStyle.blackOpenSans16W600.copyWith(color: titleColor ?? white),
        ),
      ),
    ),
  );
}

Widget commonFilledButtonGrey(
    {required Function onTap, required String title, TextStyle? textStyle}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: offWhite,
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: offWhite.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 4),
            )
          ]),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: textStyle ?? AppFontStyle.blackOpenSans16W600.copyWith(color: textColor),
        ),
      ),
    ),
  );
}

Widget commonSocialButton({required Function onTap, required ExactAssetImage icon}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), border: Border.all(color: colorGrey, width: 1)),
      child: Image(
        height: 24,
        width: 24,
        image: icon,
      ),
    ),
  );
}
