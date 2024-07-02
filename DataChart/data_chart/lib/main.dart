// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'AppColors.dart';

void main() {
  runApp(const MyApp());
}

List<FlSpot> value = [];
double x = 0, y = 0;


class DataEntry {
  final DateTime date;
  final double value;

  DataEntry({required this.date, required this.value});
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> gradientColors = [
    Colors.pink.shade300,
    Colors.red.shade400,
    Colors.red.shade600,
    Colors.purple,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    const buttonStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      color: Colors.red,
      backgroundColor: Colors.black,
    );

    void addVal() {
      int currentDay = DateTime.now().day;
      int currentMonth = DateTime.now().month;
      int ti=DateTime.now().microsecondsSinceEpoch;
      // print('$currentDay,$currentMonth');
      setState(() {
        value.add(FlSpot(ti.toDouble(), y));
        print(ti.toDouble());
      });
      x += 5.0;
      y += 2.0;
    }

    return Scaffold(
      backgroundColor: Color(0xFFABABDD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.50,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
          TextButton(
            onPressed: addVal,
            child: Text(
              'CLICK',
              style: buttonStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    text =  Text('${date.month}/${date.day}', style: style);
    // switch (value.toInt()) {
    //   case 2:
    //     text = const Text('MAR', style: style);
    //     break;
    //   case 5:
    //     text = const Text('JUN', style: style);
    //     break;
    //   case 8:
    //
    //     text = const Text('SEP', style: style);
    //     break;
    //   default:
    //     text = const Text('', style: style);
    //     break;
    // }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData:


      FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // reservedSize: 30,
            interval: 1,
              getTitlesWidget:bottomTitleWidgets ,
          ),

        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            // reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: value,
          // isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

/*
  List<FlSpot> value = [
    // FlSpot(1, 10),
    // FlSpot(2, 1),
    // FlSpot(3, 2),
    // FlSpot(4, 9),
    // FlSpot(5, 4),
    // FlSpot(6, 25),
    // FlSpot(7, 10),
    // FlSpot(8, 1),
    // FlSpot(9, 2),
    // FlSpot(10, 9),
    // FlSpot(11, 4),
    // FlSpot(12, 25),
    // FlSpot(13, 0),
    // FlSpot(14, 1),
    // FlSpot(15, 2),
    // FlSpot(16, 9),
    // FlSpot(17, 4),
    // FlSpot(18, 25),
    // FlSpot(19, 10),
    // FlSpot(20, 1),
    // FlSpot(21, 2),
    // FlSpot(22, 9),
    // FlSpot(23, 4),
    // FlSpot(24, 25),
  ];
  var temp = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.blue.shade300,
                lineBarsData: [
                  LineChartBarData(
                    spots: value,
                    color: Colors.red,
                    barWidth: 2,
                    curveSmoothness: 0.35,
                    isCurved: true,
                    isStrokeCapRound: true,
                    isStrokeJoinRound: true,
                    preventCurveOverShooting: true,
                  ),
                ],
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    axisNameSize: 20,
                    axisNameWidget: Text(
                      'BMI Value',

                    ),
                  ),

                ),
                // read about it in the LineChartData section
              ),
            ),
          ),
          TextButton(
            onPressed: () => {
              setState(
                () {
                  temp += 5.0;
                  // var ti = DateTime.now().minute.toDouble();
                  value.add(
                    FlSpot(temp, 5),
                  );
                },
              ),
            },
            child: Text(
              'CLICK',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
*/
