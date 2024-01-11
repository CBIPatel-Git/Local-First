import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_first/Utility/assets_utility.dart';
import 'package:local_first/Utility/colors_utility.dart';
import 'package:local_first/View/Home/account_screen.dart';
import 'package:local_first/View/Home/home_screen.dart';
import 'package:local_first/View/Home/my_cart_screen.dart';
import 'package:local_first/View/Home/store_screen.dart';
import 'package:local_first/View/Home/wishlist_screen.dart';
import '../../CustomWidget/custom_bottom_nav_bar_dot.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  RxInt currentIndex = 0.obs;
  List<Widget> tabs = const [
    HomeScreen(), //The problem
    StoreScreen(),
    MyCartScreen(), //The problem
    WishlistScreen(),
    AccountScreen(), //The problem
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: currentIndex.stream,
        builder: (context, snapshot) {
          return Scaffold(
            bottomNavigationBar: CustomBottomNavBarDot(
              onChange: (index) {
                currentIndex.value = index;
              },
              defaultSelectedIndex: 0,
              selectedColor: colorPrimary,
              unselectedColor: textColor,
              backgroundColor: Colors.grey.shade100,
              radius: 25,
              showLabel: true,
              textList: const [
                'Home',
                'Store',
                'My Cart',
                'Wishlist',
                'Account',
              ],
              iconList: [
                iconsHome,
                iconsSore,
                iconsMyCart,
                iconsWishlist,
                iconsAccount,
              ],
            ),
            extendBody: true,
            body: tabs[currentIndex.value],
          );
        });
  }
}
