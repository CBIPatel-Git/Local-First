import 'dart:ffi';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_first/View/Authentication/login_screen.dart';
import 'package:local_first/View/Dashboard/MyCart/my_order_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Utility/utility_export.dart';
import 'coupon_screen.dart';
import 'edit_profile_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  RxString selectedImage = ''.obs;

  @override
  void initState() {
    Map<String, dynamic> params = {"user_id": 186};
    kAccountController.accountAPICall(params, () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              commonAppBar(
                  preFix: const SizedBox(
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    'Account',
                    style: AppFontStyle.blackOpenSans18W600,
                  ),
                  sufFix: appBarButton(image: iconsInfo, callBack: () {})),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() {
                    return Column(
                      children: [
                        height10,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 140,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 110,
                                      width: 110,
                                      child: Stack(
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: colorPrimary2, width: 3),
                                                  borderRadius: BorderRadius.circular(22)),
                                              child: Obx(() {
                                                return ClipRRect(
                                                  borderRadius: BorderRadius.circular(20),
                                                  child: selectedImage.value.isEmpty
                                                      ? kAccountController.accountModel.value.data
                                                                  ?.userUrl?.isNotEmpty ==
                                                              true
                                                          ? CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              height: 30,
                                                              width: 47,
                                                              imageUrl: kAccountController
                                                                      .accountModel
                                                                      .value
                                                                      .data
                                                                      ?.userUrl ??
                                                                  '',
                                                              errorWidget: (context, url, error) =>
                                                                  const Icon(
                                                                Icons.error,
                                                                color: Colors.grey,
                                                              ),
                                                            )
                                                          : Padding(
                                                              padding: const EdgeInsets.all(20.0),
                                                              child: Image(
                                                                image: iconsAccount,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            )
                                                      : Image(
                                                          image:
                                                              FileImage(File(selectedImage.value)),
                                                          fit: BoxFit.cover,
                                                        ),
                                                );
                                              })),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: InkWell(
                                              splashColor: white,
                                              highlightColor: white,
                                              onTap: () {
                                                picImageFromGallery();
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: white,
                                                    borderRadius: BorderRadius.circular(8)),
                                                child: Image(
                                                  image: iconsCamera,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                kAccountController
                                                        .accountModel.value.data?.userNicename ??
                                                    '-',
                                                style: AppFontStyle.blackOpenSans18W700,
                                              ),
                                              customHeight(8),
                                              Text(
                                                kAccountController
                                                        .accountModel.value.data?.userEmail ??
                                                    '-',
                                                style: AppFontStyle.greyOpenSans12W400,
                                              ),
                                              height05,
                                              Text(
                                                '(219) 555-0114',
                                                style: AppFontStyle.greyOpenSans12W400,
                                              ),
                                            ],
                                          ).marginOnly(left: 10),
                                          Positioned(
                                            right: 0,
                                            child: InkWell(
                                              highlightColor: white,
                                              splashColor: white,
                                              onTap: () {
                                                Get.to(() => const EditProfileScreen());
                                              },
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                                  decoration: BoxDecoration(
                                                      color: colorLightGrey.withOpacity(0.3),
                                                      borderRadius: BorderRadius.circular(10)),
                                                  child: Image(image: iconsEditProfile)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        height10,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            height10,
                            Text(
                              'Accounts',
                              style: AppFontStyle.blackOpenSans16W700,
                            ),
                            commonListTile(
                                title: 'My Orders',
                                icon: iconsMyOrders,
                                onTap: () {
                                  Get.to(() => const MyOrderScreen());
                                }),
                            commonListTile(
                                title: 'Wishlist',
                                icon: iconsLike,
                                onTap: () {
                                  kHomeController.currentTabIndex.value = 3;
                                  kHomeController.currentTabIndex.refresh();
                                }),
                            commonListTile(title: 'Address', icon: iconsAddress, onTap: () {}),
                            commonListTile(
                                title: 'Notification', icon: iconsNotification, onTap: () {}),
                          ]),
                        ),
                        height10,
                        commonBoxShadowContainer(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            height10,
                            Text(
                              'Offers',
                              style: AppFontStyle.blackOpenSans16W700,
                            ),
                            commonListTile(
                                title: 'Couple',
                                icon: iconsCoupon,
                                onTap: () {
                                  Get.to(() => const CouponScreen());
                                }),
                          ]),
                        ),
                        height10,
                        commonBoxShadowContainer(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            height10,
                            Text(
                              'Privacy',
                              style: AppFontStyle.blackOpenSans16W700,
                            ),
                            commonListTile(
                                title: 'Privacy Policy', icon: iconsCoupon, onTap: () {}),
                          ]),
                        ),
                        height20,
                        commonIconTextButton(
                            icon: Image(
                              image: iconsLogout,
                            ),
                            title: 'Log out',
                            callBack: () {
                              setIsLogin(isLogin: false);
                              Get.offAll(const LoginScreen());
                            }).marginSymmetric(horizontal: 20),
                        height14,
                        commonFilledButton(
                                onTap: () {},
                                title: 'Register your store',
                                bgColor: offWhite,
                                titleColor: colorGrey)
                            .marginSymmetric(horizontal: 20),
                        customHeight(100),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }

  Widget commonListTile(
      {required String title, required ExactAssetImage icon, required Function onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
      leading: Image(
        image: icon,
        height: 24,
        width: 24,
      ),
      onTap: () {
        onTap();
      },
      title: Text(
        title,
        style: AppFontStyle.blackOpenSans14W600,
      ),
      trailing: Image(image: iconsNextArrow),
    );
  }

  Future<void> picImageFromGallery() async {
    var permissionStatus = await Permission.photos.status;
    if (!permissionStatus.isGranted) {
      showToast(message: "Provide Storage permission to pic photos.");
      await Permission.photos.request();
      return;
    }
    if (await Permission.photos.isGranted) {
      // Pick an image
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery /*, imageQuality: 25*/);
        if (image != null) {
          final imageTemporary = File(image.path);
          selectedImage.value = imageTemporary.path;
        }
      } on PlatformException catch (e) {
        print('failed to pic image: $e');
      }
    } else {
      if (permissionStatus.isPermanentlyDenied) {
        print('====> Permanently denied');
        openAppSettings();
      }
      showToast(message: "Provide Storage permission to pic photos.");
    }
  }
}
