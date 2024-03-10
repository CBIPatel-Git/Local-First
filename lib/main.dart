import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_first/View/OnBoarding/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:local_first/Utility/utility_export.dart';

import 'VendorFlow/Dashboard/vadd_products.dart';
import 'VendorFlow/Dashboard/vadd_sub_category.dart';
import 'VendorFlow/Dashboard/vdashboard_screen.dart';
import 'VendorFlow/Dashboard/vmanger_order.dart';
import 'View/Authentication/location_access_screen.dart';
import 'View/Dashboard/Home/product_details_screen.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp();
  await GetStorage.init();
  auth = FirebaseAuth.instanceFor(app: app);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

/// Google App ID Firebase
//project-286257970154

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ThemeData().colorScheme.copyWith(primary: colorPrimary),
        useMaterial3: true,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: const SplashScreen(),
    );
  }
}
