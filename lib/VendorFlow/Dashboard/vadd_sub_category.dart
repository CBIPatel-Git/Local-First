import 'package:dotted_border/dotted_border.dart';

import '../../Utility/utility_export.dart';

class VAddSubCategory extends StatefulWidget {
  const VAddSubCategory({super.key});

  @override
  State<VAddSubCategory> createState() => _VAddSubCategoryState();
}

class _VAddSubCategoryState extends State<VAddSubCategory> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                commonAppBar(
                    preFix: const SizedBox(
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                      'Add Sub-Category',
                      style: AppFontStyle.blackOpenSans18W600,
                    ),
                    sufFix: appBarButton(image: iconsDelete, callBack: () {})),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (_, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 118,
                            child: Stack(
                              children: [
                                Container(
                                  height: 110,
                                  width: 110,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: DottedBorder(
                                    color: cardBorder,
                                    strokeWidth: 1,
                                    dashPattern: const [10, 4],
                                    radius: const Radius.circular(12),
                                    borderType: BorderType.RRect,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image(image: iconsUpload),
                                          height16,
                                          Text(
                                            'Upload',
                                            style: AppFontStyle.greyOpenSans14W600,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: index == 3 - 1
                                        ? GestureDetector(
                                            onTap: () {}, child: Image(image: iconsClose))
                                        : const SizedBox()),
                              ],
                            ),
                          ),
                          width14,
                          Expanded(
                            child: commonTextField(
                                labelText: 'Category Name',
                                hintText: 'Mobile & Electronic',
                                textEditingController: null,
                                keyboardType: TextInputType.emailAddress,
                                validationFunction: (val) {
                                  return emailValidation(val);
                                }),
                          ),
                        ],
                      ).paddingOnly(top: 15);
                    }),
                height20,
                Row(
                  children: [
                    Image(image: iconsAddItem),
                    customWidth(6),
                    Text(
                      'Add Sub-Category',
                      style: AppFontStyle.blackOpenSans14W500.copyWith(color: colorPrimary),
                    )
                  ],
                ).paddingOnly(left: 16),
                height20,
                const Divider(
                  thickness: 10,
                  color: whiteEDEDED,
                ),
                height30,
                commonFilledButton(onTap: () {}, title: 'Save Changes')
                    .paddingSymmetric(horizontal: 16)
              ],
            ),
          ),
        ));
  }
}
