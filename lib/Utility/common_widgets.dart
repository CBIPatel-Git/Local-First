import 'package:cached_network_image/cached_network_image.dart';
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

Widget commonNetworkImageView(
    {required String imageUrl, ExactAssetImage? placeHolder, double? height, double? width}) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    height: height ?? 48,
    width: width ?? 48,
    imageUrl: imageUrl,
    errorWidget: (context, url, error) => SizedBox(
      height: height ?? 48,
      width: width ?? 48,
      child: Image(
        image: placeHolder ?? imagesProfilePicture,
        height: height ?? 48,
        width: width ?? 48,
      ),
    ),
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

Widget profilePlaceHolder({required String firstName, required String lastName}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: 125,
      width: 125,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.grey.withOpacity(0.3)),
      child: Center(
        child: Text(
          '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}',
          style: AppFontStyle.blackOpenSans22W600.copyWith(color: colorPrimary2, fontSize: 40),
        ),
      ),
    ),
  );
}

Widget commonNetworkImage(
    {required String url,
    double? height,
    double? width,
    double? radios,
    BoxFit? fit,
    double? extraPaddingPlaceholder,
    ImageProvider? placeHolder}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radios ?? 7),
    child: CachedNetworkImage(
      height: height ?? 73,
      width: width ?? 73,
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      errorWidget: (context, url, error) => Container(
        height: height ?? 73,
        width: width ?? 73,
        decoration: BoxDecoration(color: colorGrey.withOpacity(0.1)),
        padding: const EdgeInsets.all(20),
        child: Image(
          height: height ?? 73,
          width: width ?? 73,
          image: placeHolder ?? imagesItemPlaceholder,
          fit: fit ?? BoxFit.fitHeight,
          color: colorGrey,
        ).paddingAll(extraPaddingPlaceholder ?? 0),
      ),
    ),
  );
}

Widget noDataPlaceholder({double? height, double? width, BoxFit? fit, ImageProvider? placeHolder}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(
        height: height ?? 73,
        width: width ?? 73,
        image: placeHolder ?? imagesItemPlaceholder,
        fit: fit ?? BoxFit.fitHeight,
        color: colorGrey,
      ),
      height14,
      Text(
        'No data found!',
        style: AppFontStyle.blackOpenSans16W500,
      ),
    ],
  );
}
