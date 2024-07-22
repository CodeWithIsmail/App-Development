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
    List<BarChartGroupData> barGroups = [];
    for (int i = 0; i < day.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: day[i],
          barRods: [
            BarChartRodData(
              width: 10,
              toY: val[i],
              gradient: barGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
      );
    }
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 60,
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

  Widget getTitles(double value, TitleMeta meta) {
    String text=value.toInt().toString();
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(text, style: barChartBottomStyle),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    String text = value.toInt().round().toString();
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(text, style: barChartLeftStyle),
    );
  }
}
