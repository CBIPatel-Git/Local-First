import '../../../Utility/utility_export.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  TextEditingController searchController = TextEditingController();

  RxBool isLoading = true.obs;

  @override
  void initState() {
    getMyOrder();
    super.initState();
  }

  void getMyOrder({bool? refresh}) {
    if (kAccountController.myOrderModel.value.data != null) {
      isLoading.value = false;
    }
    if (kAccountController.myOrderModel.value.data == null || (refresh ?? false)) {
      Map<String, dynamic> params = {"per_page": 3, "page": 1};
      kAccountController.getMyOrderApiCall(params, () {
        isLoading.value = false;
      }, showProgress: refresh);
    }
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: Obx(() {
            return Column(
              children: [
                commonAppBar(
                    preFix: appBarButton(
                        image: iconsBackIcon,
                        callBack: () {
                          Get.back();
                        }),
                    title: Text(
                      'Account',
                      style: AppFontStyle.blackOpenSans18W600,
                    ),
                    sufFix: appBarButton(
                        image: iconsInfo,
                        callBack: () {
                          Get.back();
                        })),
                !isLoading.value
                    ? kAccountController.myOrderModel.value.data != null &&
                            kAccountController.myOrderModel.value.data!.isNotEmpty
                        ? Expanded(
                            child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  height05,
                                  commonTextField(
                                      borderRadius: 100,
                                      hintText: 'Search your order here',
                                      textEditingController: searchController,
                                      preFixIcon: iconsSearch,
                                      isReadOnly: true,
                                      onTapFunction: () {},
                                      suffixIcon: SizedBox(
                                        width: 70,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 1,
                                              height: 28,
                                              color: colorGrey,
                                            ),
                                            Image(image: iconsFilter),
                                          ],
                                        ),
                                      )),
                                  height20,
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount:
                                        kAccountController.myOrderModel.value.data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(vertical: 8),
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: white,
                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: offWhite,
                                              blurRadius: 10.0, // soften the shadow
                                              spreadRadius: 3.0, //extend the shadow
                                              offset: Offset(
                                                1.0, // Move to right 5  horizontally
                                                1.0, // Move to bottom 5 Vertically
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(Radius.circular(5)),
                                                  child: commonNetworkImage(
                                                      url: (kAccountController
                                                                  .myOrderModel
                                                                  .value
                                                                  .data?[index]
                                                                  .lineItems
                                                                  .isNotEmpty ??
                                                              false)
                                                          ? (kAccountController
                                                                  .myOrderModel
                                                                  .value
                                                                  .data?[index]
                                                                  .lineItems[0]
                                                                  .image
                                                                  ?.src ??
                                                              '')
                                                          : ''),
                                                  // child: Image(
                                                  //   width: 57,
                                                  //   image: imagesCategoryProduct1,
                                                  //   fit: BoxFit.fill,
                                                  // ),
                                                ),
                                                width10,
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      if (kAccountController.myOrderModel.value
                                                              .data?[index].lineItems.isNotEmpty ==
                                                          true)
                                                        Text(
                                                          '${kAccountController.myOrderModel.value.data?[index].lineItems[0].name}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: AppFontStyle.blackOpenSans14W600,
                                                        ),
                                                      Text(
                                                        'Samsung galaxy S21 FE 5G mobile',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: AppFontStyle.greyOpenSans12W400,
                                                      ),
                                                      customHeight(8),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(100),
                                                            border: Border.all(
                                                                color: colorGrey.withOpacity(0.5),
                                                                width: 1)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 15, vertical: 4),
                                                          child: Text(
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            'Shared by ${kAccountController.myOrderModel.value.data?[index].shipping?.firstName} ${kAccountController.myOrderModel.value.data?[index].shipping?.lastName}',
                                                            style: AppFontStyle.greyOpenSans12W500,
                                                          ),
                                                        ),
                                                        // child: commonClickableText(
                                                        //     padding: const EdgeInsets.symmetric(
                                                        //         horizontal: 15, vertical: 4),
                                                        //     callBack: () {
                                                        //       print('object........');
                                                        //     },
                                                        //     text:
                                                        //         'Shared by ${kAccountController.myOrderModel.value.data?[index].shipping?.firstName} ${kAccountController.myOrderModel.value.data?[index].shipping?.lastName}',
                                                        //     textStyle:
                                                        //         AppFontStyle.greyOpenSans12W500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.arrow_forward_ios_rounded,
                                                      color: colorGrey,
                                                      size: 20,
                                                    ))
                                              ],
                                            ),
                                            height16,
                                            commonFilledButtonGrey(
                                              height: 40,
                                              onTap: () {},
                                              textStyle: AppFontStyle.greyOpenSans16W600,
                                              title: 'Track Order',
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ).marginOnly(bottom: 40)
                                ],
                              ),
                            ),
                          ))
                        : Expanded(child: Center(child: noDataPlaceholder()))
                    : const Expanded(child: Center(child: CircularProgressIndicator()))
              ],
            );
          }),
        ));
  }
}
