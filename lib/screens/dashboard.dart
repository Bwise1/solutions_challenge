import 'package:flutter/material.dart';
import 'package:smart_agriculture/utils/spacing.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isEnabled = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD3D3D3),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                addVerticalSpace(20.0),
                Text("Welcome PadreShelby"),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Water pump ($_isEnabled)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Switch(
                          value: _isEnabled,
                          onChanged: _toggleSwitch,
                          activeTrackColor: Colors.blue,
                          inactiveTrackColor: Colors.grey,
                          activeColor: Colors.yellow,
                          inactiveThumbColor: Colors.grey,
                        ),
                      ]),
                ),
                const SingleChildScrollView(
                    child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('Temperature(Current)'),
                        subtitle: Text('predict_temp'),
                        trailing: Text('current_temp°C',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Humidity(Current)'),
                        subtitle: Text('predict_hum%'),
                        trailing: Text('current_hum',
                            style: TextStyle(color: Colors.green)),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
