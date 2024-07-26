// ignore_for_file: prefer_const_constructors

import '../ImportAll.dart';

class MyChart2 extends StatefulWidget {
  FirestoreService firestoreService;

  MyChart2(this.firestoreService);

  @override
  State<MyChart2> createState() => _MyChart2State();
}

class _MyChart2State extends State<MyChart2> {
  late Stream<Map<String, double>> _expensesStream;

  @override
  void initState() {
    super.initState();
    _expensesStream = getExpensesStream();
  }

  Stream<Map<String, double>> getExpensesStream() async* {
    // DateTime now = DateTime.now();
    // DateTime fifteenDaysAgo = now.subtract(Duration(days: 15));
    // DateFormat dateFormat = DateFormat('dd-MMM-yy');
    Map<String, double> expenses = {};

    for (String category in Category) {
      print(category);
      expenses[category] = 0;
    }

    final collectionRef = FirebaseFirestore.instance
        .collection(widget.firestoreService.collectionName);

    yield* collectionRef.snapshots().map((querySnapshot) {
      List<QueryDocumentSnapshot> filteredDocs =
          querySnapshot.docs.where((doc) {
        // DateTime docDate = dateFormat.parse(doc['date']);
        return doc['Transaction_type'] == 'Expense';
      }).toList();

      for (var doc in filteredDocs) {
        String cate = doc['Category'];
        double amount = double.tryParse(doc['Amount'].toString()) ?? 0.0;
        expenses[cate] = (expenses[cate] ?? 0) + amount;
      }

      return expenses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, double>>(
      stream: _expensesStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return BarChart(
            mainBarChartData(snapshot.data!),
          );
        }
      },
    );
  }

  BarChartData mainBarChartData(Map<String, double> expenses) {
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < expenses.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              width: 10,
              toY: expenses[Category[i]]!,
              gradient: barGradient,
            )
          ],
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
    String text = Category[value.toInt()];
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
