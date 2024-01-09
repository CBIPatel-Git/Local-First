import 'package:local_first/Utility/utility_export.dart';

Widget commonClickableText(
    {required Function callBack, required String text, TextStyle? textStyle}) {
  return InkWell(
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
