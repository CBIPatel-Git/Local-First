import '../../Utility/utility_export.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Stack(
          children: [
            Image(
              image: imagesBg1,
              fit: BoxFit.cover,
              width: getScreenWidth(context),
              height: getScreenHeight(context),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customHeight(55),
                    Text(
                      'Location access',
                      style: AppFontStyle.blackOpenSans18W600,
                    ),
                    customHeight(62),
                    Center(child: Image(image: imagesAccessLocation)),
                    customHeight(51),
                    Text(
                      'Grant Current location',
                      style: AppFontStyle.blackOpenSans22W600.copyWith(fontSize: 24),
                    ),
                    customHeight(8),
                    Text(
                      'This let us show nearby store, you can\n order from',
                      style: AppFontStyle.greyOpenSans14W400,
                      textAlign: TextAlign.center,
                    ),
                    customHeight(30),
                    commonFilledButton(
                      onTap: () {},
                      title: 'Use current location',
                    ),
                    customHeight(30),
                    commonFilledButtonGrey(
                      onTap: () {},
                      title: 'Enter manually',
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}