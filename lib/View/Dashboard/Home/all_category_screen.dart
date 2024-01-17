import '../../../Utility/utility_export.dart';
import 'category_product_screen.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  RxInt selectedCategory = 0.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
            child: Column(
          children: [
            commonAppBar(
                preFix: appBarButton(
                    image: iconsBackIcon,
                    callBack: () {
                      Get.back();
                    }),
                title: Text(
                  'All Category',
                  style: AppFontStyle.blackOpenSans16W600,
                ),
                sufFix: appBarButton(image: iconsLike, callBack: () {})),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: 25,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedCategory.value = index;
                          },
                          child: Obx(() {
                            return Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: selectedCategory.value == index ? white : orangeFFE5C1,
                                  border: const Border(
                                      bottom: BorderSide(width: 1, color: colorPrimary))),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image(image: iconsMainCategories),
                                        Text(
                                          'Kids',
                                          style: AppFontStyle.blackOpenSans12W400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (selectedCategory.value == index)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          height: 50,
                                          width: 5,
                                          decoration: const BoxDecoration(
                                              color: colorPrimary,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)))),
                                    ),
                                ],
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              image: imagesMobileBanner,
                              height: 74,
                              width: getScreenWidth(context),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mobiles',
                                  style: AppFontStyle.blackOpenSans14W600,
                                ),
                                InkWell(
                                  splashColor: white,
                                  highlightColor: white,
                                  onTap: () {
                                    Get.to(() => const CategoryProductScreen());
                                  },
                                  child: Container(
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                        color: lightOrange,
                                        borderRadius: BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: white,
                                      size: 16,
                                    ),
                                  ),
                                ).marginOnly(right: 10)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(() {
                              return GridView.builder(
                                shrinkWrap: true,
                                itemCount: selectedCategory.value + 1,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: getSliverGridDelegate(context)/*2 / 2.5*/),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                            color: whiteF7F7F7,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Image(
                                          image: iconsSubCategories,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'APPLE',
                                          style: AppFontStyle.blackOpenSans12W600,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
