// ignore_for_file: prefer_const_constructors

import '../ImportAll.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarChartData(),
    );
  }

  BarChartData mainBarChartData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 45,
            showTitles: true,
            getTitlesWidget: leftTitles,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      barGroups: barGroups,
    );
  }

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Color(0xFF355C7D),
          Color(0xFF6C5B7B),
          Color(0xFFC06C84),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              width: 15,
              backDrawRodData: BackgroundBarChartRodData(
                color: Colors.grey,
                toY: 20,
                show: false,
              ),
              gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              width: 15,
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              width: 15,
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              width: 15,
              toY: 13,
              gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              width: 15,
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              width: 15,
              toY: 16,
              gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              width: 15,
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
      ];

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    int temp = value.toInt();
    text = '$temp';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    int temp = value.toInt().round();
    String text;
    text = '$temp K';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
}
