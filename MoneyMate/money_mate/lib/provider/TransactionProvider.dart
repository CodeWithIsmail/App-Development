import '../ImportAll.dart';
import 'dart:async';

class TransactionProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<TransactionModel> _transactions = [];
  List<ChartDataTimewise> _chartDataTimewise = [];
  List<ChartDataCategorywise> _chartDataCatwise = [];
  int _income = 0;
  int _expense = 0;
  int _netBalance = 0;

  bool isLoading = false;

  List<ChartDataCategorywise> get chartDataCatwise => _chartDataCatwise;

  List<ChartDataTimewise> get chartDataTimewise => _chartDataTimewise;

  int get income => _income;

  int get expense => _expense;

  int get netBalance => _netBalance;

  List<TransactionModel> get transactions => _transactions;

  StreamSubscription? _transactionSubscription;

  TransactionProvider() {
    _startListeningToTransactions();
  }

  void _startListeningToTransactions() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    final email = currentUser.email;
    final username = email?.substring(0, email.indexOf("@moneymate.com"));
    final userCollectionRef = _firestore.collection(username!);

    _transactionSubscription = userCollectionRef.snapshots().listen(
      (querySnapshot) {
        _transactions = querySnapshot.docs
            .map((doc) => TransactionModel.fromFirestore(doc.data()))
            .toList();
        calculateBalance();
        notifyListeners();
      },
      onError: (error) {
        print('Error listening to transactions: $error');
      },
    );
  }

  void updateChartDataByRange(DateTime start, DateTime end) {

    _chartDataTimewise = [];
    Map<int, double> totalExpense = {};
    for (var transaction in _transactions) {
      if (transaction.transactionType == 'Expense' &&
          transaction.dateTime!.isAfter(start) &&
          transaction.dateTime!.isBefore(end)) {
        int dateEpoch = transaction.dateTime?.millisecondsSinceEpoch ?? 0;
        double currentAmount = transaction.amount?.toDouble() ?? 0;
        totalExpense[dateEpoch] =
            (totalExpense[dateEpoch] ?? 0) + currentAmount;
      }
    }
    totalExpense.forEach((key, value) {
      _chartDataTimewise.add(ChartDataTimewise(key, value));
    });

    _chartDataTimewise.sort((a, b) => a.time.compareTo(b.time));
    notifyListeners();
  }

  void calculateBalance() {
    _income = 0;
    _expense = 0;
    _chartDataTimewise = [];
    _chartDataCatwise = [];
    Map<int, double> totalExpense = {};
    Map<String, double> totalExpenseCat = {};
    for (var transaction in _transactions) {
      if (transaction.transactionType == 'Income') {
        _income += transaction.amount?.toInt() ?? 0;
      } else {
        _expense += transaction.amount?.toInt() ?? 0;
        int dateEpoch = transaction.dateTime?.millisecondsSinceEpoch ?? 0;
        String category = transaction.category ?? "Unknown";
        double currentAmount = transaction.amount?.toDouble() ?? 0;
        totalExpense[dateEpoch] =
            (totalExpense[dateEpoch] ?? 0) + currentAmount;
        totalExpenseCat[category] =
            (totalExpenseCat[category] ?? 0) + currentAmount;
      }
    }
    totalExpense.forEach((key, value) {
      _chartDataTimewise.add(ChartDataTimewise(key, value));
    });
    totalExpenseCat.forEach((key, value) {
      _chartDataCatwise.add(ChartDataCategorywise(key, value));
    });
    _chartDataTimewise.sort((a, b) => a.time.compareTo(b.time));

    _netBalance = _income - _expense;
  }

  @override
  void dispose() {
    _transactionSubscription?.cancel();
    super.dispose();
  }
}
