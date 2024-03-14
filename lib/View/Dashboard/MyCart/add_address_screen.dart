import 'package:local_first/Models/CartModels/shipping_address_model.dart';

import '../../../Utility/utility_export.dart';
import '../Account/notification_screen.dart';

class AddAddressScreen extends StatefulWidget {
  String? screenType;
  Datum? currentAddress;

  AddAddressScreen({super.key, this.screenType, this.currentAddress});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  String? selectedValue;
  RxBool homeAddressSelected = true.obs;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController streetAddress2Controller = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.screenType == 'Edit Address') {
      initField();
    }
  }

  void initField() {
    firstNameController.text = widget.currentAddress?.firstName ?? '';
    lastNameController.text = widget.currentAddress?.lastName ?? '';
    streetAddressController.text = widget.currentAddress?.address1 ?? '';
    streetAddress2Controller.text = widget.currentAddress?.address2 ?? '';
    zipCodeController.text = widget.currentAddress?.zipCode ?? '';
    phoneNumberController.text = widget.currentAddress?.number.toString() ?? '';
    cityController.text = widget.currentAddress?.city ?? '';
    stateController.text = widget.currentAddress?.state ?? '';
    countryController.text = widget.currentAddress?.country ?? '';
    homeAddressSelected.value = widget.currentAddress?.type == 'home' ? true : false;
    setState(() {});
  }

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
                  sufFix: appBarButton(
                      image: iconsBell,
                      callBack: () {
                        Get.to(() => const NotificationScreen());
                      })),
              Expanded(
                child: Form(
                  key: globalKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      height20,
                      commonDropDown(title: 'Country'),
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
                      commonDropDown(title: 'State'),
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
                          stream: homeAddressSelected.stream,
                          builder: (context, snapshot) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    homeAddressSelected.value = true;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: homeAddressSelected.value == true
                                            ? colorPrimary2.withOpacity(0.10)
                                            : white,
                                        border: Border.all(
                                            color: homeAddressSelected.value == true
                                                ? colorPrimary2
                                                : colorE3E3E3),
                                        borderRadius: const BorderRadius.all(Radius.circular(25))),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: iconsHome,
                                          color: homeAddressSelected.value == true
                                              ? colorPrimary2
                                              : black,
                                        ),
                                        customWidth(8),
                                        Text(
                                          'Home',
                                          style: AppFontStyle.blackOpenSans14W500.copyWith(
                                              color: homeAddressSelected.value == true
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
                                    homeAddressSelected.value = false;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: homeAddressSelected.value == false
                                            ? colorPrimary2.withOpacity(0.10)
                                            : white,
                                        border: Border.all(
                                            color: homeAddressSelected.value == false
                                                ? colorPrimary2
                                                : colorE3E3E3),
                                        borderRadius: const BorderRadius.all(Radius.circular(25))),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: iconsOffice,
                                          color: homeAddressSelected.value == false
                                              ? colorPrimary2
                                              : black,
                                        ),
                                        customWidth(8),
                                        Text(
                                          'Office',
                                          style: AppFontStyle.blackOpenSans14W500.copyWith(
                                              color: homeAddressSelected.value == false
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
                              Map<String, dynamic> params = {
                                "user_id": kAuthenticationController.userId,
                                "first_name": firstNameController.text,
                                "last_name": lastNameController.text,
                                "type": homeAddressSelected.value ? "home" : "office",
                                "address_1": streetAddressController.text,
                                "address_2": streetAddress2Controller.text,
                                "city": cityController.text,
                                "state": "gujarat",
                                "zip_code": zipCodeController.text,
                                "country": "india",
                                "number": phoneNumberController.text
                              };
                              if (widget.screenType == 'Edit Address') {
                                // shippingAddressModel
                                params.addAllIf(widget.screenType == 'Edit Address',
                                    {"id": widget.currentAddress?.id});
                                kCartController.editAddressApiCall(params, () {
                                  // Get.to(() => const ShippingAddressScreen());
                                  Map<String, dynamic> data = {
                                    "user_id": kAuthenticationController.userId
                                  };
                                  kCartController.getUserAddressApiCall(data, () {});
                                  Get.back();
                                });
                              } else if (widget.screenType == 'Add Address') {
                                kCartController.addAddressApiCall(params, () {
                                  Map<String, dynamic> data = {
                                    "user_id": kAuthenticationController.userId
                                  };
                                  kCartController.getUserAddressApiCall(data, () {});
                                  Get.back();
                                });
                              }
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

  commonDropDown({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
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
