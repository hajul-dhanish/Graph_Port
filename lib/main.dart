import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() => runApp(_ChartApp());

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_          // Expanded(
  //   child: Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     //Initialize the spark charts widget
  //     child: SfSparkLineChart.custom(
  //       //Enable the trackball
  //       trackball: const SparkChartTrackball(
  //           activationMode: SparkChartActivationMode.tap),
  //       //Enable marker
  //       marker: const SparkChartMarker(
  //           displayMode: SparkChartMarkerDisplayMode.all),
  //       //Enable data label
  //       labelDisplayMode: SparkChartLabelDisplayMode.all,
  //       xValueMapper: (int index) => data[index].year,
  //       yValueMapper: (int index) => data[index].sales,
  //       dataCount: 5,
  //     ),
  //   ),
  // )in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 36),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  List<_SalesData> buyed = [
    _SalesData('Jan', 25),
    _SalesData('Feb', 18),
    _SalesData('Mar', 14),
    _SalesData('Apr', 42),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Customer Sec.'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings:
                        const DataLabelSettings(isVisible: true)),
                LineSeries<_SalesData, String>(
                    dataSource: buyed,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Buy',
                    // Enable data label
                    dataLabelSettings:
                        const DataLabelSettings(isVisible: true)),
              ]),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     //Initialize the spark charts widget
          //     child: SfSparkLineChart.custom(
          //       //Enable the trackball
          //       trackball: const SparkChartTrackball(
          //           activationMode: SparkChartActivationMode.tap),
          //       //Enable marker
          //       marker: const SparkChartMarker(
          //           displayMode: SparkChartMarkerDisplayMode.all),
          //       //Enable data label
          //       labelDisplayMode: SparkChartLabelDisplayMode.all,
          //       xValueMapper: (int index) => data[index].year,
          //       yValueMapper: (int index) => data[index].sales,
          //       dataCount: 5,
          //     ),
          //   ),
          // )
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
