import 'package:local_first/View/Dashboard/MyCart/shipping_address_screen.dart';

import '../../../Utility/utility_export.dart';

class AddAddressScreen extends StatefulWidget {
  String? screenType;

  AddAddressScreen({super.key, this.screenType});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  String? selectedValue;
  RxBool? selectedIndex = true.obs;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController streetAddress2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
                    widget.screenType ?? '',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: appBarButton(image: iconsBell, callBack: () {})),
              Expanded(
                child: Form(
                  key: globalKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      height20,
                      commonDropDown(),
                      height16,
                      commonTextField(
                          labelText: 'First Name',
                          hintText: 'CR',
                          textEditingController: firstNameController,
                          validationFunction: (val) {
                            return isNotEmptyValidation(val);
                          }),
                      height16,
                      commonTextField(
                          labelText: 'Last Name',
                          hintText: 'CR',
                          textEditingController: lastNameController,
                          validationFunction: (val) {
                            return isNotEmptyValidation(val);
                          }),
                      height16,
                      commonTextField(
                          labelText: 'Street Address',
                          hintText: 'CR',
                          textEditingController: streetAddressController,
                          validationFunction: (val) {
                            return isNotEmptyValidation(val);
                          }),
                      height16,
                      commonTextField(
                        labelText: 'Street Address 2 (optional)',
                        hintText: 'CR',
                        textEditingController: streetAddress2Controller,
                      ),
                      height16,
                      commonTextField(
                          labelText: 'City',
                          hintText: 'CR',
                          textEditingController: cityController,
                          validationFunction: (val) {
                            return isNotEmptyValidation(val);
                          }),
                      height16,
                      commonDropDown(),
                      height16,
                      commonTextField(
                          labelText: 'Zip Code',
                          hintText: '45463',
                          keyboardType: TextInputType.number,
                          textEditingController: zipCodeController,
                          validationFunction: (val) {
                            return isNotEmptyValidation(val);
                          }),
                      height16,
                      commonTextField(
                          labelText: 'Phone Number',
                          hintText: '+91 98765432190',
                          keyboardType: TextInputType.number,
                          textEditingController: phoneNumberController,
                          validationFunction: (val) {
                            return phoneNumberValidation(val);
                          }),
                      height16,
                      Text(
                        'Address Type',
                        style: AppFontStyle.blackOpenSans14W500,
                      ),
                      customHeight(8),
                      StreamBuilder<Object>(
                          stream: selectedIndex?.stream,
                          builder: (context, snapshot) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectedIndex?.value = true;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: selectedIndex?.value == true
                                            ? colorPrimary2.withOpacity(0.10)
                                            : white,
                                        border: Border.all(
                                            color: selectedIndex?.value == true
                                                ? colorPrimary2
                                                : colorE3E3E3),
                                        borderRadius: const BorderRadius.all(Radius.circular(25))),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: iconsHome,
                                          color:
                                              selectedIndex?.value == true ? colorPrimary2 : black,
                                        ),
                                        customWidth(8),
                                        Text(
                                          'Home',
                                          style: AppFontStyle.blackOpenSans14W500.copyWith(
                                              color: selectedIndex?.value == true
                                                  ? colorPrimary2
                                                  : black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                width20,
                                GestureDetector(
                                  onTap: () {
                                    selectedIndex?.value = false;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: selectedIndex?.value == false
                                            ? colorPrimary2.withOpacity(0.10)
                                            : white,
                                        border: Border.all(
                                            color: selectedIndex?.value == false
                                                ? colorPrimary2
                                                : colorE3E3E3),
                                        borderRadius: const BorderRadius.all(Radius.circular(25))),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: iconsOffice,
                                          color:
                                              selectedIndex?.value == false ? colorPrimary2 : black,
                                        ),
                                        customWidth(8),
                                        Text(
                                          'Office',
                                          style: AppFontStyle.blackOpenSans14W500.copyWith(
                                              color: selectedIndex?.value == false
                                                  ? colorPrimary2
                                                  : black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                      customHeight(32),
                      commonFilledButton(
                          onTap: () {
                            if (globalKey.currentState!.validate()) {
                              Get.to(() => const ShippingAddressScreen());
                            }
                          },
                          title: widget.screenType == 'Add Address'
                              ? 'Save Address'
                              : 'Update Address'),
                      customHeight(25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  commonDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Country',
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
