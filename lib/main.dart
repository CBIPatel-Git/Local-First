import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_first/Utility/colors_utility.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'View/OnBoarding/on_boarding_screen.dart';

void main() {
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
      home: const OnBoardingScreen(),
    );
  }
}
