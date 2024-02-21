import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataPoint {
  final String timestamp;
  final double predictTemp;
  final int currentTemp;
  final double predictHum;
  final int currentHum;

  DataPoint({
    required this.timestamp,
    required this.predictTemp,
    required this.currentTemp,
    required this.predictHum,
    required this.currentHum,
  });

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      timestamp: json['timestamp'],
      predictTemp: json['predict_temp'],
      currentTemp: json['current_temp'],
      predictHum: json['predict_hum'],
      currentHum: json['current_hum'],
    );
  }
}

class DashboardController extends GetxController {
  var isLoading = true.obs;
  var data = [].obs;
  late List<DataPoint> _dataPoints;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  void _toggleSwitch() {
    // Implement your switch logic here
  }

  Future<void> fetchDashboardData() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://app-5lwmw6wrbq-uc.a.run.app/api/v1/data'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        List<dynamic> dataList = jsonResponse['data'];
        _dataPoints = dataList
            .map((data) => DataPoint.fromJson(data))
            .toList(); // Assign value to private variable
        data.assignAll(_dataPoints);
        update();
      } else {
        log('Error - ${response.statusCode}');
      }
    } finally {
      isLoading(false);
    }
  }

  List<DataPoint> get dataPoints => _dataPoints;
}
