import '../ImportAll.dart';

class MoneyDashboard extends StatefulWidget {
  FirestoreService firestoreService;

  MoneyDashboard(this.firestoreService);

  @override
  State<MoneyDashboard> createState() => _MoneyDashboardState();
}

class _MoneyDashboardState extends State<MoneyDashboard> {
  late Stream<Map<String, int>> _BalanceDataStream;

  @override
  void initState() {
    super.initState();
    _BalanceDataStream = getExpensesStream();
  }

  Stream<Map<String, int>> getExpensesStream() async* {
    int income = 0;
    int expense = 0;
    int netBal = 0;

    final collectionRef = FirebaseFirestore.instance
        .collection(widget.firestoreService.collectionName);

    yield* collectionRef.snapshots().map((querySnapshot) {
      List<QueryDocumentSnapshot> filteredDocs = querySnapshot.docs.toList();

      for (var doc in filteredDocs) {
        String cate = doc['Transaction_type'];
        double amount = double.tryParse(doc['Amount'].toString()) ?? 0.0;
        cate == 'Expense'
            ? expense += amount.toInt()
            : income += amount.toInt();
      }
      netBal = income - expense;
      print(netBal);
      return {
        'NetBalance': netBal,
        'Income': income,
        'Expense': expense,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, int>>(
      stream: _BalanceDataStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data available'));
        } else {
          return customColumn(snapshot.data!.cast<String, int>());
        }
      },
    );
  }

  Column customColumn(Map<String, int> Balance) {
    print('Printing here: $Balance');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Net Balance',
          style: NetBalTextStyle,
        ),
        Text(
          Balance['NetBalance'].toString(),
          style: BalTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BalanceShowGroup(CupertinoIcons.down_arrow, Colors.red.shade900,
                'Expense', Balance['Expense']!),
            BalanceShowGroup(CupertinoIcons.up_arrow, Colors.lightGreenAccent,
                'Income', Balance['Income']!),
          ],
        )
      ],
    );
  }
}
