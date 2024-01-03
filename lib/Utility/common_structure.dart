import 'package:local_first/Utility/assets_utility.dart';
import 'package:local_first/Utility/utility_export.dart';

Widget commonStructure({
  required BuildContext context,
  required Widget child,
  PreferredSize? appBar,
  Color? bgColor,
  Widget? bottomNavigation,
}) {
  ///Pass null in appbar when it's optional ex = appBar : null
  return Scaffold(
    backgroundColor: bgColor ?? transparent,
    resizeToAvoidBottomInset: true,
    appBar: appBar,
    bottomNavigationBar: bottomNavigation,

    ///adding listView cause scroll issue
    body: Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: child,
    ),
  );
}
