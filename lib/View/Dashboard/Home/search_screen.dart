import '../../../Utility/utility_export.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonAppBar(
                  preFix: appBarButton(
                      image: iconsBackIcon,
                      callBack: () {
                        hideKeyboard(context);
                        Get.back();
                      }),
                  title: SizedBox(
                    width: getScreenWidth(context) * 0.6,
                    child: commonTextField(
                        borderRadius: 100,
                        hintText: 'Search for products',
                        textEditingController: searchController,
                        preFixIcon: iconsSearch,
                        onChangedFunction: (val) {
                          print("Val >>>>> $val");
                        }),
                  ),
                  sufFix: Badge(
                      backgroundColor: redLight,
                      label: Text(
                        '10',
                        style:
                            AppFontStyle.blackOpenSans12W600.copyWith(color: white, fontSize: 10),
                      ),
                      child: appBarButton(image: iconsCart, callBack: () {})),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height10,
                      Text(
                        'Recent Searches',
                        style: AppFontStyle.blackOpenSans16W600,
                      ),
                      height10,
                      Wrap(
                        children:
                            List<Widget>.generate(kHomeController.recentSearchList.length, (i) {
                          return InkWell(
                            splashColor: white,
                            highlightColor: white,
                            onTap: () {
                              searchController.text = kHomeController.recentSearchList[i];
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                                decoration: BoxDecoration(
                                    color: offWhite, borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  kHomeController.recentSearchList[i],
                                  style: AppFontStyle.blackOpenSans12W400,
                                )),
                          );
                        }).toList(),
                      ),
                      height10,
                      Text(
                        'Popular Items',
                        style: AppFontStyle.blackOpenSans16W600,
                      ),
                      height10,
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 2 / 2),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: imagesPopularItem,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
