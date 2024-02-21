import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture/controllers/auth_controller.dart';
import 'package:smart_agriculture/controllers/dashboard_controller.dart';
import 'package:smart_agriculture/utils/spacing.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final DashboardController dashboardController =
      Get.put(DashboardController());

  final AuthController authController = Get.find<AuthController>();

  final bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    // final data = dashboardController.fetchDashboardData();
    double currentTemp = double.parse(
        dashboardController.dataPoints[0].currentTemp.toStringAsFixed(2));
    double currentHumdity = double.parse(
        dashboardController.dataPoints[0].currentHum.toStringAsFixed(2));

    double maxTemp = 70;
    return Scaffold(
        backgroundColor: const Color(0xFFD3D3D3),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                addVerticalSpace(20.0),
                Obx(() => Text(
                      'Welcome, ${authController.userDisplayname.value.isNotEmpty ? authController.userDisplayname.value : 'Thomys Lowe'}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Water pump ($_isEnabled)',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Switch(
                          value: _isEnabled,
                          onChanged: (_isEnabled) => {},
                          activeTrackColor: Colors.blue,
                          inactiveTrackColor: Colors.grey,
                          activeColor: Colors.yellow,
                          inactiveThumbColor: Colors.grey,
                        ),
                      ]),
                ),
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Temperature(Current)',
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: CustomChart(
                                max: maxTemp,
                                current: currentTemp,
                                color: Colors.red,
                                degreeSymbol: '°C',
                              ),
                            ),
                            Text(
                              'Next Prediction ${dashboardController.dataPoints[0].predictHum.toStringAsFixed(2)}°C',
                              style: const TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Humidity(Current)',
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: CustomChart(
                                max: 100,
                                current: currentHumdity,
                                color: Colors.green,
                                degreeSymbol: '%',
                              ),
                            ),
                            Text(
                              'Next Prediction ${dashboardController.dataPoints[0].predictHum.toStringAsFixed(2)}%',
                              style: const TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

class CustomChart extends StatelessWidget {
  final double max;
  final double current;
  final Color color;
  final String degreeSymbol;

  const CustomChart({
    super.key,
    required this.max,
    required this.current,
    required this.color,
    required this.degreeSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                value: current,
                color: color,
                radius: 10,
                showTitle: false,
              ),
              PieChartSectionData(
                value: max - current,
                color: Colors.grey,
                radius: 10,
                showTitle: false,
              ),
            ],
            sectionsSpace: 0,
            centerSpaceRadius: 45,
            centerSpaceColor: Colors.transparent,
            startDegreeOffset: -90,
          ),
        ),
        Center(
          child: Text(
            '${current.toStringAsFixed(2)}$degreeSymbol',
            style: TextStyle(color: color),
          ),
        ),
      ],
    );
  }
}
