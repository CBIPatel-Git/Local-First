import '../../../Utility/utility_export.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: Column(
            children: [
              commonAppBar(
                  preFix: Image(image: iconsBackIcon),
                  title: Text(
                    'Account',
                    style: AppFontStyle.blackOpenSans18W600,
                  ),
                  sufFix: Image(image: iconsInfo)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        height05,
                        commonTextField(
                            borderRadius: 100,
                            hintText: 'Search Products & store',
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
                          itemCount: 5,
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
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          child: Image(
                                            width: 57,
                                            image: imagesCategoryProduct1,
                                            fit: BoxFit.fill,
                                          )),
                                      width10,
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'SAMSUNG Galaxy M34 5G (Prism Silver, 128 GB)',
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
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.all(
                                                      color: colorGrey.withOpacity(0.5), width: 1)),
                                              child: commonClickableText(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 15, vertical: 4),
                                                  callBack: () {
                                                    print('object........');
                                                  },
                                                  text: 'Shared by Jason Wick',
                                                  textStyle: AppFontStyle.greyOpenSans12W500),
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
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
