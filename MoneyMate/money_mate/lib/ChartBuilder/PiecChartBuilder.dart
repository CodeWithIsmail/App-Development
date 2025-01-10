import 'package:money_mate/ChartBuilder/ChartDataCatwise.dart';

import '../ImportAll.dart';

class CustomPieChart extends StatelessWidget {
  String chartTitle, uname;
  List<ChartDataCategorywise> dataList;

  CustomPieChart(this.chartTitle, this.uname, this.dataList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SfCircularChart(
        borderWidth: 1.5,
        borderColor: Colors.brown,
        backgroundColor: Colors.white,
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.top,
          alignment: ChartAlignment.center,
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: ChartTitle(
          text: chartTitle,
          textStyle: TextStyle(
            color: Colors.green.shade900,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <PieSeries>[
          PieSeries<ChartDataCategorywise, String>(
            explode: true,
            explodeIndex: 0,
            name: uname,
            dataSource: dataList,
            xValueMapper: (ChartDataCategorywise data, _) => data.category,
            yValueMapper: (ChartDataCategorywise data, _) => data.value,
            dataLabelSettings: const DataLabelSettings(isVisible: false),
          ),
        ],
      ),
    );
  }
}
