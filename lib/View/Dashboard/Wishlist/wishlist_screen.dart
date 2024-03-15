import 'package:local_first/View/Dashboard/Home/product_details_screen.dart';

import '../../../Utility/utility_export.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  RxBool isLoading = true.obs;

  @override
  void initState() {
    getWishList();
    super.initState();
  }

  void getWishList({bool? refresh}) {
    if (kHomeController.wishlistModel.value.data != null) {
      isLoading.value = false;
    }
    if (kHomeController.wishlistModel.value.data == null || (refresh ?? false)) {
      Map<String, dynamic> params = {"user_id": kAuthenticationController.userId};
      kHomeController.getWishlistAPICall(params, () {
        isLoading.value = false;
      }, showProgress: refresh);
    }
  }

  Future<void> _pullRefresh() async {
    getWishList(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: StreamBuilder(
              stream: kHomeController.finalWishData.stream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    commonAppBar(
                        preFix: appBarButton(image: iconsBackIcon, callBack: () {}),
                        title: Text(
                          'Wishlist',
                          style: AppFontStyle.blackOpenSans18W600,
                        ),
                        sufFix: appBarButton(image: iconsInfo, callBack: () {})),
                    height10,
                    !isLoading.value
                        ? kHomeController.finalWishData.isNotEmpty
                            ? Expanded(
                                child: GridView.builder(
                                  itemCount: kHomeController.finalWishData.length,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, mainAxisExtent: 220),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 12,
                                            offset:
                                                const Offset(0, 0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      margin: const EdgeInsets.all(5),
                                      padding: const EdgeInsets.all(5),
                                      child: InkWell(
                                        onTap: (() {
                                          Get.to(() => ProductDetailsScreen(
                                              productId:
                                                  kHomeController.finalWishData[index].id ?? 0));
                                        }),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                SizedBox(
                                                  height: 106,
                                                  width: getScreenWidth(context),
                                                  child: commonNetworkImage(
                                                      url: (kHomeController.finalWishData[index]
                                                                  .images.isNotEmpty
                                                              ? kHomeController.finalWishData[index]
                                                                  .images[0].src
                                                              : '') ??
                                                          ''),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      width: 28,
                                                      height: 28,
                                                      margin: const EdgeInsets.all(10),
                                                      padding: const EdgeInsets.all(3),
                                                      decoration: BoxDecoration(
                                                          color: colorPrimary,
                                                          borderRadius: BorderRadius.circular(100)),
                                                      child: const Icon(Icons.more_horiz,
                                                          color: white),
                                                      // child: Image(
                                                      //   image: iconsLike,
                                                      // ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            height12,
                                            Text(
                                              '${kHomeController.finalWishData[index].name}',
                                              style: AppFontStyle.blackOpenSans16W600,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            height05,
                                            Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 17,
                                                      color: colorPrimary,
                                                    ),
                                                    width05,
                                                    Text(
                                                      '${kHomeController.finalWishData[index].averageRating}',
                                                      style: AppFontStyle.blackOpenSans12W500,
                                                    ),
                                                  ],
                                                ),
                                                width14,
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_outlined,
                                                      size: 17,
                                                      color: colorPrimary,
                                                    ),
                                                    width05,
                                                    Text(
                                                      '190m',
                                                      style: AppFontStyle.blackOpenSans12W500,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            height05,
                                            Row(
                                              children: [
                                                Text(
                                                  '\$${kHomeController.finalWishData[index].salePrice}',
                                                  style: AppFontStyle.blackOpenSans16W700
                                                      .copyWith(color: colorPrimary2),
                                                ),
                                                width10,
                                                Text(
                                                  '\$${kHomeController.finalWishData[index].regularPrice}',
                                                  style: AppFontStyle.greyOpenSans12W400.copyWith(
                                                      decoration: TextDecoration.lineThrough),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    // Cart click
                                                    print("Cart click");
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(horizontal: 5),
                                                    child: Image(image: iconsCartRound),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Expanded(child: Center(child: noDataPlaceholder()))
                        : const Expanded(child: Center(child: CircularProgressIndicator())),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
