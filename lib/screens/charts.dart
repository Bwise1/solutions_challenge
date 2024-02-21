import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture/controllers/dashboard_controller.dart';

class Charts extends StatelessWidget {
  Charts({super.key});

  final DashboardController dashboardController =
      Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: dashboardController.dataPoints
                    .map((item) => BarChartGroupData(
                          x: DateTime.parse(item.timestamp).hour,
                          barRods: [
                            BarChartRodData(
                                y: double.parse(
                                    item.currentTemp.toStringAsFixed(2)),
                                colors: [Colors.red]),
                          ],
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
