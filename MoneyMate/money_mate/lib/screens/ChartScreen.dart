import '../ImportAll.dart';

class ExpenseChartBuilder extends StatefulWidget {
  @override
  _ExpenseChartBuilderState createState() => _ExpenseChartBuilderState();
}

class _ExpenseChartBuilderState extends State<ExpenseChartBuilder>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String uname = "";
  String selectedRange = 'Last Week';
  late DateTime startDate, endDate;

  @override
  void initState() {
    super.initState();
    uname = getCurrentUser() ?? "";
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Visualization"),
          centerTitle: true,
          toolbarHeight: 20,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.purple,
            tabs: const [
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
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomPieChart("Category wise Expense Pie Chart", uname,
                            transactionProvider.chartDataCatwise),
                        CustomColumnChartCategory(
                            "Category wise Expense Column Chart",
                            uname,
                            transactionProvider.chartDataCatwise),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButton<String>(
                            value: selectedRange,
                            items: <String>[
                              'Last Week',
                              'Last 15 Days',
                              'Last Month',
                              'Last Year',
                              'All',
                              'Custom',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                selectedRange = newValue;
                                dateRangePicker(transactionProvider);
                                transactionProvider.updateChartDataByRange(
                                    startDate, endDate);
                              }
                            },
                          ),
                        ),
                        CustomLineChart("Date wise Expense Line Chart", uname,
                            transactionProvider.chartDataTimewise),
                        CustomColumnChart("Date wise Expense Column Chart",
                            uname, transactionProvider.chartDataTimewise),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dateRangePicker(TransactionProvider transactionProvider) {
    DateTime now = DateTime.now();
    endDate = now;
    switch (selectedRange) {
      case "Last Week":
        startDate = now.subtract(const Duration(days: 7));
        break;
      case "Last 15 Days":
        startDate = now.subtract(const Duration(days: 15));
        break;
      case "Last Month":
        startDate = now.subtract(const Duration(days: 30));
        break;
      case "Last Year":
        startDate = now.subtract(const Duration(days: 365));
        break;
      case "Custom":
        // Handle custom date range, you can implement a DatePicker here
        break;
      case "All":
        startDate = DateTime.fromMillisecondsSinceEpoch(
            transactionProvider.chartDataTimewise.first.time * 1000);
        endDate = DateTime.now();
        break;
      default:
        startDate = now.subtract(const Duration(days: 7));
    }
  }
}
