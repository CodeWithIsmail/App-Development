// ignore_for_file: prefer_const_constructors

import '../ImportAll.dart';

class MyChart extends StatefulWidget {
  final FirestoreService firestoreService;
  final DateTime startdate;

  MyChart(this.firestoreService, this.startdate);

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  late Stream<Map<String, double>> _expensesStream;

  @override
  void initState() {
    super.initState();
    _expensesStream = getExpensesStream();
  }

  @override
  void didUpdateWidget(covariant MyChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startdate != widget.startdate) {
      _expensesStream = getExpensesStream();
    }
  }

  Stream<Map<String, double>> getExpensesStream() async* {
    DateTime now = widget.startdate;
    print(now);
    DateTime fifteenDaysAgo = now.subtract(Duration(days: 15));
    DateFormat dayFormat = DateFormat('dd');
    DateFormat dateFormat = DateFormat('dd-MMM-yy');
    Map<String, double> expenses = {};

    for (int i = 14; i >= 0; i--) {
      DateTime date = now.subtract(Duration(days: i));
      expenses[dayFormat.format(date)] = 0;
    }

    final collectionRef = FirebaseFirestore.instance
        .collection(widget.firestoreService.collectionName);

    yield* collectionRef.snapshots().map((querySnapshot) {
      List<QueryDocumentSnapshot> filteredDocs =
          querySnapshot.docs.where((doc) {
        DateTime docDate = dateFormat.parse(doc['date']);
        return (docDate.isAfter(fifteenDaysAgo) ||
                docDate.isAtSameMomentAs(fifteenDaysAgo)) &&
            docDate.isBefore(now.add(Duration(days: 0))) &&
            doc['Transaction_type'] == 'Expense';
      }).toList();

      for (var doc in filteredDocs) {
        DateTime docDate = dateFormat.parse(doc['date']);
        String day = dayFormat.format(docDate);
        double amount = double.tryParse(doc['Amount'].toString()) ?? 0.0;
        expenses[day] = (expenses[day] ?? 0) + amount;
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

    expenses.forEach((key, value) {
      int date = int.parse(key);
      double amount = value;
      print('$date : $amount');
      barGroups.add(
        BarChartGroupData(
          x: date,
          barRods: [
            BarChartRodData(
              width: 10,
              toY: amount,
              gradient: barGradient,
            )
          ],
        ),
      );
    });

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
    String text = value.toInt().toString();
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
