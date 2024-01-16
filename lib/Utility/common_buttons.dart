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

Widget commonSwitchButton({required Function isDelivery}) {
  return Container(
    height: 40,
    width: 150,
    decoration: BoxDecoration(
      color: offWhite,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Row(
      children: [
        InkWell(
          splashColor: white,
          highlightColor: white,
          onTap: () {
            kHomeController.isDeliveryEnable.value = true;
            isDelivery(kHomeController.isDeliveryEnable.value);
          },
          child: Obx(() {
            return Container(
              width: kHomeController.isDeliveryEnable.value ? 95 : 45,
              height: 35,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: kHomeController.isDeliveryEnable.value ? colorPrimary : offWhite,
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: iconsDeliveryCar,
                    color: kHomeController.isDeliveryEnable.value ? white : colorGrey,
                  ),
                  if (kHomeController.isDeliveryEnable.value)
                    Text(
                      "Delivery",
                      style: AppFontStyle.blackOpenSans12W500.copyWith(color: white),
                    )
                ],
              ),
            );
          }),
        ),
        InkWell(
          splashColor: white,
          highlightColor: white,
          onTap: () {
            kHomeController.isDeliveryEnable.value = false;
            isDelivery(kHomeController.isDeliveryEnable.value);
          },
          child: Obx(() {
            return Container(
              width: kHomeController.isDeliveryEnable.value ? 45 : 95,
              height: 35,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: kHomeController.isDeliveryEnable.value ? offWhite : colorPrimary,
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: iconsTakeAway,
                    color: kHomeController.isDeliveryEnable.value ? colorGrey : white,
                  ),
                  if (!kHomeController.isDeliveryEnable.value)
                    Text(
                      "Pick-up",
                      style: AppFontStyle.blackOpenSans12W500.copyWith(color: white),
                    )
                ],
              ),
            );
          }),
        )
      ],
    ),
  );
}

Widget appBarButton(
    {required ExactAssetImage image,
    required Function callBack,
    double? height,
    double? width,
    Color? iconColor,
    double? iconPadding}) {
  return InkWell(
    splashColor: white,
    highlightColor: white,
    onTap: () {
      callBack();
    },
    child: Container(
      height: height ?? 40,
      width: width ?? 40,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: colorGrey.withOpacity(0.3), width: 1)),
      child: Image(
        image: image,
        color: iconColor,
      ).paddingAll(iconPadding ?? 0),
    ),
  );
}

Widget commonFilledButtonGrey(
    {required Function onTap, required String title, TextStyle? textStyle, double? height}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      height: height ?? 50,
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

Widget commonIconTextButton(
    {Widget? icon,
    required String title,
    required Function callBack,
    Color? bgColor,
    TextStyle? textStyle}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: bgColor ?? colorPrimary),
      onPressed: () {
        callBack();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon,
          if (icon != null) width10,
          Text(
            title,
            style: textStyle ?? AppFontStyle.blackOpenSans16W600.copyWith(color: white),
          )
        ],
      ).paddingSymmetric(vertical: 12));
}
