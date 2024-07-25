import 'package:money_mate/ImportAll.dart';

class FirestoreService {
  final String collectionName;

  FirestoreService(this.collectionName);

  Future<void> addRecord(
      String type, String category, int amount, String date) {
    final CollectionReference transaction =
        FirebaseFirestore.instance.collection(this.collectionName);
    return transaction.add(
      {
        'Transaction_type': type,
        'Category': category,
        'Amount': amount,
        'date': date,
      },
    );
  }

  Future<void> updateRecord(
      String type, String category, int amount, String date, String id) {
    final CollectionReference transaction =
        FirebaseFirestore.instance.collection(this.collectionName);
    return transaction.doc(id).update(
      {
        'Transaction_type': type,
        'Category': category,
        'Amount': amount,
        'date': date,
      },
    );
  }

  Future<void> deleteRecord(String id) {
    final CollectionReference transaction =
        FirebaseFirestore.instance.collection(this.collectionName);
    return transaction.doc(id).delete();
  }

  Stream<QuerySnapshot> getRecords() {
    final CollectionReference transaction =
        FirebaseFirestore.instance.collection(this.collectionName);
    return transaction.orderBy('date', descending: true).snapshots();
  }
}
