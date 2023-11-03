import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Pie Chart Demo'),
      ),
      body: Center(
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Colors.blue,
                value: 30,
                title: 'Category A',
              ),
              PieChartSectionData(
                color: Colors.green,
                value: 40,
                title: 'Category B',
              ),
              PieChartSectionData(
                color: Colors.orange,
                value: 20,
                title: 'Category C',
              ),
              PieChartSectionData(
                color: Colors.red,
                value: 10,
                title: 'Category D',
              ),
            ],
          ),
        ),
      ),
    );
  }
}