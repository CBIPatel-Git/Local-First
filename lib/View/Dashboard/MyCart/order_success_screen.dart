import 'package:local_first/View/Dashboard/Home/customer_review_screen.dart';

import '../../../Utility/utility_export.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customHeight(42),
            Center(child: Image(image: imagesSuccessOrder)),
            height30,
            Text(
              'Your order is successfully done',
              textAlign: TextAlign.center,
              style: AppFontStyle.blackOpenSans22W700.copyWith(fontSize: 30),
            ),
            height10,
            Text(
              'You can track the delivery in the \n“My Orders” section.',
              textAlign: TextAlign.center,
              style: AppFontStyle.greyOpenSans16W400,
            ),
            customHeight(60),
            commonFilledButton(onTap: () {}, title: 'View Order'),
            height12,
            commonFilledButton(
                onTap: () {

                },
                title: 'View E- Receipt',
                bgColor: offWhite,
                textStyle: AppFontStyle.greyOpenSans16W600),
          ],
        ).paddingSymmetric(horizontal: 20));
  }
}
