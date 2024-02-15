import 'dart:developer';

import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:smart_agriculture/controllers/nav_controller.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key, this.shouldPopScreenOnNavTap = true})
      : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
  final bool shouldPopScreenOnNavTap;
}

class _MyNavBarState extends State<MyNavBar> {
  final NavigationController controller = Get.find();
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    log(index.toString());

    controller.updateNavIndex = index;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        selectedIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Obx(() {
      return Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: themeData.colorScheme.secondary),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: themeData.colorScheme.background,
          currentIndex: controller.currentIndex.value,
          useLegacyColorScheme: false,
          selectedLabelStyle: const TextStyle(
              // color: primaryBgColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Euclid-Bold'),
          unselectedLabelStyle: TextStyle(
              color: themeData.colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontFamily: 'Euclid-Bold'),
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
              ),
              label: 'Chart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Account',
            ),
          ],
        ),
      );
    });
  }
}
