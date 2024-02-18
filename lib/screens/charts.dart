import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Center(
        child: Text('Charts'),
      ),
    ));
  }

  ChartData chartData = ChartData(
    dataRows: const [
      [30.0, 25.0, 40.0, 35.0, 45.0], // Replace with your actual data
      [70.0, 75.0, 65.0, 80.0, 85.0], // Replace with your actual data
    ],
    xUserLabels: const [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May'
    ], // Replace with your actual labels
    dataRowsLegends: const [
      'Temperature',
      'Humidity'
    ], // Replace with your actual legends
    chartOptions: const ChartOptions(),
  );
  ChartData _getHumData() {
    return ChartData(
      dataRows: const [
        [70.0, 75.0, 65.0, 80.0, 85.0], // Replace with your actual data
      ],
      xUserLabels: const [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May'
      ], // Replace with your actual labels
      dataRowsLegends: const ['Humidity'], // Replace with your actual legend
      chartOptions: const ChartOptions(),
    );
  }
}
