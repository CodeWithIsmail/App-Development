// ignore_for_file: prefer_const_constructors

import '../ImportAll.dart';

class MyChart2 extends StatefulWidget {
  const MyChart2({super.key});

  @override
  State<MyChart2> createState() => _MyChart2State();
}

class _MyChart2State extends State<MyChart2> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarChartData(),
    );
  }

  BarChartData mainBarChartData() {
    List<BarChartGroupData> barGroups = [];
    for (int i = 0; i < categoryExpense.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i + 1,
          barRods: [
            BarChartRodData(
              width: 15,
              toY: categoryExpense[i],
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
    String text = Category[value.toInt() - 1];
    print(text);
    // String text = '1';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child:
          Text(text,  style: barChartBottomStyle),
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
