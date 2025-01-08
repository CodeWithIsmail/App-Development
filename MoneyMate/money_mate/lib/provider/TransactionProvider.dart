import 'dart:async';
import '../ImportAll.dart';

class TransactionProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<TransactionModel> _transactions = [];
  int _income = 0;
  int _expense = 0;
  int _netBalance = 0;

  bool isLoading = false;

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

  void calculateBalance() {
    _income = 0;
    _expense = 0;
    for (var transaction in _transactions) {
      if (transaction.transactionType == 'Income') {
        _income += transaction.amount!.toInt();
      } else {
        _expense += transaction.amount!.toInt();
      }
    }
    _netBalance = _income - _expense;
  }

  @override
  void dispose() {
    _transactionSubscription
        ?.cancel(); // Cancel the stream subscription on provider disposal
    super.dispose();
  }
}
