import '../ImportAll.dart';

class CustomColumnChartCategory extends StatelessWidget {
  String chartTitle, uname;
  List<ChartDataCategorywise> dataList;

  CustomColumnChartCategory(this.chartTitle, this.uname, this.dataList,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SfCartesianChart(
        title: ChartTitle(
          text: chartTitle,
          textStyle: TextStyle(
            color: Colors.green.shade900,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        plotAreaBorderWidth: 0,
        borderColor: Colors.brown,
        borderWidth: 1.35,
        backgroundColor: Colors.white,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          decimalPlaces: 0,
          labelFormat: '{value}',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent),
        ),
        legend: const Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          enablePinching: true,
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
        ),
        crosshairBehavior: CrosshairBehavior(
          activationMode: ActivationMode.doubleTap,
          enable: true,
          lineColor: Colors.green,
          lineWidth: 1,
        ),
        series: <CartesianSeries>[
          ColumnSeries<ChartDataCategorywise, String>(
            name: uname,
            dataSource: dataList,
            xValueMapper: (ChartDataCategorywise data, int index) =>
                data.category,
            yValueMapper: (ChartDataCategorywise data, int index) => data.value,
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            spacing: 0,
          ),
        ],
      ),
    );
  }
}
