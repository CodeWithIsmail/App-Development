import 'ImportAll.dart';

class ExpenseChart extends StatefulWidget {
  @override
  _ExpenseChartState createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart>
    with TickerProviderStateMixin {
  List<ExpenseData> _chartData = [];
  List<DateWiseExpenseData> _lineChartData = [];
  bool _isLoading = true;
  late TabController _tabController;
  late PageController _pageController;
  String uname = "";

  @override
  void initState() {
    super.initState();
    _fetchAndGroupData();
    _fetchDateWiseData();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index);
      }
    });

    _pageController.addListener(() {
      if (_pageController.page!.toInt() != _tabController.index) {
        _tabController.animateTo(_pageController.page!.toInt());
      }
    });

    String? email = FirebaseAuth.instance.currentUser?.email;
    uname = email!.substring(0, email.indexOf('@'));
  }

  Future<void> _fetchDateWiseData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ismail360')
          .orderBy('dateTime', descending: false)
          .get();
      List<ExpenseData> fetchedData = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ExpenseData(
          type: data['Transaction_type'],
          category: data['Category'],
          amount: (data['Amount'] as num).toDouble(),
          dateTime: (data['dateTime'] as Timestamp).toDate(),
        );
      }).toList();

      Map<String, double> dateWiseData = {};
      for (var expense in fetchedData) {
        if (expense.type == "Expense") {
          String date =
              DateFormat('dd-MMM-yy').format(expense.dateTime!.toLocal());
          dateWiseData[date] = (dateWiseData[date] ?? 0) + expense.amount;
        }
      }

      List<DateWiseExpenseData> dateWiseChartData =
          dateWiseData.entries.map((entry) {
        return DateWiseExpenseData(date: entry.key, amount: entry.value);
      }).toList();

      setState(() {
        _lineChartData = dateWiseChartData;
      });
    } catch (e) {
      print("Error fetching date-wise data: $e");
    }
  }

  Future<void> _fetchAndGroupData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('ismail360').get();
      List<ExpenseData> fetchedData = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ExpenseData(
          type: data['Transaction_type'],
          category: data['Category'],
          amount: (data['Amount'] as num).toDouble(),
        );
      }).toList();

      Map<String, double> groupedData = {};
      for (var expense in fetchedData) {
        if (expense.type == "Expense") {
          groupedData[expense.category] =
              (groupedData[expense.category] ?? 0) + expense.amount;
        }
      }

      List<ExpenseData> groupedChartData = groupedData.entries.map((entry) {
        return ExpenseData(category: entry.key, amount: entry.value);
      }).toList();

      setState(() {
        _chartData = groupedChartData;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _chartData.isEmpty
                ? Center(child: Text('No data available'))
                : Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.purple,
                        tabs: [
                          Tab(
                            text: "Category Wise",
                            icon: Icon(Icons.category),
                          ),
                          Tab(
                            text: "Date Wise",
                            icon: Icon(Icons.date_range),
                          ),
                        ],
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          children: [
                            _buildCategoryWiseCharts(),
                            _buildDateWiseCharts(),
                          ],
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget _buildCategoryWiseCharts() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SfCircularChart(
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.left,
                  alignment: ChartAlignment.center,
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.brown.shade100,
                title: ChartTitle(
                  text: 'Category-Wise Expenses Pie Chat',
                  textStyle: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <PieSeries<ExpenseData, String>>[
                  PieSeries<ExpenseData, String>(
                    explode: true,
                    explodeIndex: 0,
                    dataSource: _chartData,
                    xValueMapper: (ExpenseData data, _) => data.category,
                    yValueMapper: (ExpenseData data, _) => data.amount,
                    dataLabelMapper: (ExpenseData data, _) => data.type,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 30),
            child: SfCartesianChart(
              backgroundColor: Colors.brown.shade100,
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              zoomPanBehavior: ZoomPanBehavior(
                enablePanning: true,
                enablePinching: true,
                enableDoubleTapZooming: true,
                enableSelectionZooming: true,
              ),
              title: ChartTitle(
                text: 'Category-Wise Expenses Column chart',
                textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries>[
                ColumnSeries<ExpenseData, String>(
                  name: "Category - Expense",
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  gradient: barGradient,
                  width: 0.6,
                  dataSource: _chartData,
                  xValueMapper: (ExpenseData data, _) => data.category,
                  yValueMapper: (ExpenseData data, _) => data.amount,
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateWiseCharts() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SfCartesianChart(
              backgroundColor: Colors.brown.shade100,
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              title: ChartTitle(
                text: 'Date-Wise Expenses Line Chart',
                textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
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
                LineSeries<DateWiseExpenseData, String>(
                  color: Color(0xFF6C5B7B),
                  name: "Date - Expense",
                  dataSource: _lineChartData,
                  xValueMapper: (DateWiseExpenseData data, _) => data.date,
                  yValueMapper: (DateWiseExpenseData data, _) => data.amount,
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 30),
            child: SfCartesianChart(
              backgroundColor: Colors.brown.shade100,
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              title: ChartTitle(
                text: 'Date-Wise Expenses Bar Chart',
                textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
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
                ColumnSeries<DateWiseExpenseData, String>(
                  color: Color(0xFF6C5B7B),
                  name: "Date - Expense",
                  dataSource: _lineChartData,
                  xValueMapper: (DateWiseExpenseData data, _) => data.date,
                  yValueMapper: (DateWiseExpenseData data, _) => data.amount,
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseData {
  final String category;
  final double amount;
  String? type;
  final DateTime? dateTime;

  ExpenseData(
      {required this.category, required this.amount, this.type, this.dateTime});
}

class DateWiseExpenseData {
  final String date;
  final double amount;

  DateWiseExpenseData({required this.date, required this.amount});
}
