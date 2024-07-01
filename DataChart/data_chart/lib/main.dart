// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FlSpot> value = [
    FlSpot(1, 10),
    FlSpot(2, 1),
    FlSpot(3, 2),
    FlSpot(4, 9),
    FlSpot(5, 4),
    FlSpot(6, 25),
    FlSpot(7, 10),
    FlSpot(8, 1),
    FlSpot(9, 2),
    FlSpot(10, 9),
    FlSpot(11, 4),
    FlSpot(12, 25),
    FlSpot(13, 0),
    FlSpot(14, 1),
    FlSpot(15, 2),
    FlSpot(16, 9),
    FlSpot(17, 4),
    FlSpot(18, 25),
    FlSpot(19, 10),
    FlSpot(20, 1),
    FlSpot(21, 2),
    FlSpot(22, 9),
    FlSpot(23, 4),
    FlSpot(24, 25),
  ];
  var temp=30.0;
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
                lineBarsData: [
                  LineChartBarData(
                    spots: value,
                    color: Colors.red,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Colors.pinkAccent,
                    //     Colors.red,
                    //     Colors.purple,
                    //     Colors.purpleAccent,
                    //   ],
                    // ),
                    barWidth: 2,
                    curveSmoothness: 0.35,
                    isCurved: true,
                    isStrokeCapRound: true,
                    isStrokeJoinRound: true,
                    preventCurveOverShooting: true,
                    // belowBarData: BarAreaData(
                    //   show: true,
                    //   color: Colors.green.withOpacity(0.3),
                    // ),
                    dotData: FlDotData(
                      show: true,

                      // checkToShowDot: (spot, bardata) {
                      //   return spot.x == 2;
                      // },
                    ),
                  ),
                ],

                // read about it in the LineChartData section
              ),
            ),
          ),
          TextButton(
            onPressed: () => {
              setState(
                () {
                  temp+=5.0;
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

      // Center(
      //   // child k center e anbe
      //   child: AspectRatio(
      //     // width height er modhe ration
      //     aspectRatio: 1.3,
      //     child:
      //   ),
      // ),
      //
    );
  }
}
