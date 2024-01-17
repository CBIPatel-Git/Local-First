import '../../../Utility/utility_export.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? selectedValue;

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
                    'Account',
                    style: AppFontStyle.blackOpenSans18W600,
                  ),
                  sufFix: appBarButton(image: iconsInfo, callBack: () {})),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      height20,
                      commonTextField(
                          labelText: 'Name',
                          hintText: 'John Wick',
                          filledColor: whiteFAFAFA,
                          borderColor: whiteFAFAFA,
                          textEditingController: nameController,
                          validationFunction: (val) {
                            return isNotEmptyValidation(val);
                          }),
                      height16,
                      commonTextField(
                          labelText: 'Email Address',
                          hintText: 'Albertstevano@gmail.com',
                          filledColor: whiteFAFAFA,
                          borderColor: whiteFAFAFA,
                          textEditingController: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validationFunction: (val) {
                            return emailValidation(val);
                          }),
                      height16,
                      commonTextField(
                          labelText: 'Mobile Number',
                          hintText: '+91 98765432190',
                          filledColor: whiteFAFAFA,
                          borderColor: whiteFAFAFA,
                          textEditingController: numberController,
                          keyboardType: TextInputType.number,
                          validationFunction: (val) {
                            return phoneNumberValidation(val);
                          }),
                      height16,
                      createRoundedDropDown(title: 'Gender', dropDownItems: const [
                        DropdownMenuItem(child: Text("Male")),
                        DropdownMenuItem(child: Text("Female")),
                        DropdownMenuItem(child: Text("Other")),
                      ]),
                      customHeight(50),
                      commonFilledButton(onTap: () {}, title: 'Update')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget createRoundedDropDown(
      {Color? bgColor,
      required String title,
      required List<DropdownMenuItem<dynamic>> dropDownItems}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFontStyle.blackOpenSans14W500,
        ),
        height10,
        // customHeight(8),
        Container(
          height: 50,
          width: getScreenWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration:
              BoxDecoration(color: bgColor ?? whiteFAFAFA, borderRadius: BorderRadius.circular(8)),
          child: StatefulBuilder(builder: (context, setState) {
            return DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  style: AppFontStyle.greyOpenSans14W500,
                  hint: Text(
                    "Male",
                    style: AppFontStyle.greyOpenSans14W500,
                  ),
                  value: selectedValue,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorGrey,
                  ).paddingOnly(left: 5),
                  items: const [
                    DropdownMenuItem(value: "Qty 1", child: Text("Male")),
                    DropdownMenuItem(value: "Qty 2", child: Text("Female")),
                    DropdownMenuItem(value: "Qty 3", child: Text("Other")),
                  ]),
            );
          }),
        ),
      ],
    );
  }
}
