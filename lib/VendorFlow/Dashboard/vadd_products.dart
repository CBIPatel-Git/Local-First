import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../Utility/utility_export.dart';

class VAddProducts extends StatefulWidget {
  const VAddProducts({super.key});

  @override
  State<VAddProducts> createState() => _VAddProductsState();
}

class _VAddProductsState extends State<VAddProducts> {
  TextEditingController productTextController = TextEditingController(text: 'SAMSUNG S23 Ultra');
  TextEditingController priceTextController = TextEditingController(text: '\$30.00');
  TextEditingController discountTextController = TextEditingController(text: '\$19.00');
  TextEditingController descriptionTextController = TextEditingController(
      text:
          'Lorem ipsum dolor sit amet consectetur. Lorem cursus aliquet sed maecenas sollicitudin erat. Et ullamcorper mollis morbi magna placerat purus metus. Duis aenean nam eu tristique rhoncus eu.');
  String? selectedValue;
  RxString userBobSelectedDate = ''.obs;
  RxBool userDobSelected = false.obs;
  List<Color> colorList = [
    amber,
    blue,
    ping,
    teal,
    purple,
    darkBlue,
  ];

  List<String> sizeList = ['S', 'M', 'L'];

  @override
  void initState() {
    // colorList.length ++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    commonAppBar(
                        preFix: const SizedBox(
                          height: 40,
                          width: 40,
                        ),
                        title: Text(
                          'Add Products',
                          style: AppFontStyle.blackOpenSans18W600,
                        ),
                        sufFix: appBarButton(image: iconsDelete, callBack: () {})),
                    DottedBorder(
                      color: cardBorder,
                      strokeWidth: 1,
                      dashPattern: const [10, 6],
                      radius: const Radius.circular(12),
                      borderType: BorderType.RRect,
                      padding: const EdgeInsets.symmetric(vertical: 36),
                      child: Column(
                        children: [
                          Image(image: iconsUpload),
                          height16,
                          Text(
                            'Upload up to 5 Images',
                            style: AppFontStyle.greyOpenSans14W600,
                          ),
                          customHeight(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Drag & Drop or ',
                                style: AppFontStyle.blackOpenSans14W600,
                              ),
                              Text(
                                'Choose',
                                style:
                                    AppFontStyle.blackOpenSans14W600.copyWith(color: colorPrimary),
                              ),
                              Text(
                                ' file to upload',
                                style: AppFontStyle.blackOpenSans14W600,
                              ),
                            ],
                          ),
                          customHeight(8),
                          Text(
                            ' (345X255 or larger recommended, up to\n 1MB each)',
                            style: AppFontStyle.greyOpenSans14W400,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    height20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonDottedBorder(),
                        commonDottedBorder(),
                        commonDottedBorder(),
                        commonDottedBorder()
                      ],
                    ),
                    height20,
                    commonTextField(
                        labelText: 'Product Name',
                        hintText: 'Albertstevano@gmail.com',
                        textEditingController: productTextController,
                        keyboardType: TextInputType.emailAddress,
                        validationFunction: (val) {
                          return emailValidation(val);
                        }),
                    height12,
                    Row(
                      children: [
                        Expanded(
                          child: commonTextField(
                              labelText: 'Product Name',
                              hintText: 'Albertstevano@gmail.com',
                              textEditingController: priceTextController,
                              keyboardType: TextInputType.emailAddress,
                              validationFunction: (val) {
                                return emailValidation(val);
                              }),
                        ),
                        width14,
                        Expanded(
                          child: commonTextField(
                              labelText: 'Product Name',
                              hintText: 'Albertstevano@gmail.com',
                              textEditingController: discountTextController,
                              keyboardType: TextInputType.emailAddress,
                              validationFunction: (val) {
                                return emailValidation(val);
                              }),
                        ),
                      ],
                    ),
                    height12,
                    commonTextField(
                        labelText: 'Description',
                        hintText: 'Albertstevano@gmail.com',
                        textEditingController: descriptionTextController,
                        keyboardType: TextInputType.emailAddress,
                        maxLine: 5,
                        validationFunction: (val) {
                          return emailValidation(val);
                        }),
                    height12,
                    commonDropDown(labelText: 'Choose Category'),
                    height12,
                    Row(
                      children: [
                        Image(image: iconsAddItem),
                        customWidth(6),
                        Text(
                          'Add Sub-Category',
                          style: AppFontStyle.blackOpenSans14W500.copyWith(color: colorPrimary),
                        )
                      ],
                    ),
                    Obx(
                      () => InkWell(
                        splashColor: white,
                        highlightColor: white,
                        onTap: () async {
                          // userDobSelected.value = false;
                          disableFocusScopeNode(context);
                          // final date =
                          //     await userDatePicker(context: context, userDobSelected: userDobSelected);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height12,
                            Text('Product Date', style: AppFontStyle.blackOpenSans14W500),
                            height10,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: black.withOpacity(0.1), width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        userBobSelectedDate.value.isEmpty
                                            ? 'Date of birth'
                                            : userDobSelected.value
                                                ? dateFormatter(userBobSelectedDate.value,
                                                    myFormat: 'dd-MM-yyyy')
                                                : 'Date of birth',
                                        style: AppFontStyle.greyOpenSans16W500),
                                    Image(image: iconsCalendar),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    height20,
                  ],
                ),
                const Divider(
                  thickness: 10,
                  color: whiteEDEDED,
                ),
                height20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: commonDropDown(labelText: 'Shipping Option')),
                          width14,
                          Expanded(
                            child: commonTextField(
                                labelText: 'Delivery Time',
                                hintText: 'Albertstevano@gmail.com',
                                textEditingController: discountTextController,
                                keyboardType: TextInputType.emailAddress,
                                validationFunction: (val) {
                                  return emailValidation(val);
                                }),
                          ),
                        ],
                      ),
                      height12,
                      Row(
                        children: [
                          Expanded(child: commonDropDown(labelText: 'Refund Policies')),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ],
                  ),
                ),
                height20,
                const Divider(
                  thickness: 10,
                  color: whiteEDEDED,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height20,
                    Text(
                      'Color (If any)',
                      style: AppFontStyle.blackOpenSans14W700,
                    ),
                    height12,
                    Row(
                      children: colorList
                          .map((e) => e.value + 1 != colorList.length
                              ? InkWell(
                                  splashColor: white,
                                  highlightColor: white,
                                  onTap: () {
                                    print('>>>>>>>>>>> ${e.value}');
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: e, borderRadius: BorderRadius.circular(100)),
                                      ),
                                    ],
                                  ),
                                ).paddingOnly(right: 10)
                              : Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.red,
                                ))
                          .toList(),
                    ),
                    height20,
                    Text(
                      'Color (If any)',
                      style: AppFontStyle.blackOpenSans14W700,
                    ),
                    height12,
                    Row(
                      children: sizeList
                          .map((e) => InkWell(
                                splashColor: white,
                                highlightColor: white,
                                onTap: () {},
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: colorLightGrey)),
                                      child: Center(
                                          child: Text(
                                        e,
                                        style: AppFontStyle.greyOpenSans14W600,
                                      )),
                                    ),
                                  ],
                                ),
                              ).paddingOnly(right: 10))
                          .toList(),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16),
                height20,
                const Divider(
                  thickness: 10,
                  color: whiteEDEDED,
                ),
                height30,
                commonFilledButton(onTap: () {}, title: 'Publish To Store')
                    .paddingSymmetric(horizontal: 16),
                height30
              ],
            ),
          ),
        ));
  }

  commonDropDown({required String labelText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          labelText,
          style: AppFontStyle.blackOpenSans14W500,
        ),
        customHeight(08),
        Container(
          height: 50,
          width: getScreenWidth(context),
          decoration: BoxDecoration(
            border: Border.all(color: colorLightGrey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(8),
                  style: AppFontStyle.blackOpenSans12W500,
                  hint: Text(
                    "India",
                    style: AppFontStyle.greyOpenSans14W500,
                  ),
                  value: selectedValue,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  icon: Image(
                    image: iconsDown,
                  ),
                  items: const [
                    DropdownMenuItem(value: "India", child: Text("India")),
                    DropdownMenuItem(value: "US", child: Text("US")),
                    DropdownMenuItem(value: "Australia", child: Text("Australia")),
                  ]),
            ),
          ),
        )
      ],
    );
  }
}

commonDottedBorder() {
  return SizedBox(
    height: 74,
    width: 74,
    child: DottedBorder(
      color: cardBorder,
      strokeWidth: 1,
      dashPattern: const [10, 4],
      radius: const Radius.circular(12),
      borderType: BorderType.RRect,
      child: const SizedBox(),
    ),
  );
}
