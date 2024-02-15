import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture/components/nav_bar.dart';
import 'package:smart_agriculture/controllers/nav_controller.dart';
import 'package:smart_agriculture/screens/account.dart';
import 'package:smart_agriculture/screens/charts.dart';
import 'package:smart_agriculture/screens/dashboard.dart';
import 'package:smart_agriculture/screens/history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> _pages = const <Widget>[
    Dashboard(),
    Charts(),
    History(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavBar(),
      body: Obx(() {
        return _pages[navController.currentIndex.value];
      }),
    );
  }
}
