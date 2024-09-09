import '../ImportAll.dart';

class FirestoreService {
  final String collectionName;

  FirestoreService(this.collectionName);

  Future<void> addRecord(String type, String category, int amount, String date,
      DateTime datetime) {
    final CollectionReference transaction =
    FirebaseFirestore.instance.collection(this.collectionName);
    return transaction.add(
      {
        'Transaction_type': type,
        'Category': category,
        'Amount': amount,
        'date': date,
        'dateTime': datetime,
      },
    );
  }

  Future<void> updateRecord(String type, String category, int amount,
      String date, String id, DateTime datetime) {
    final CollectionReference transaction =
    FirebaseFirestore.instance.collection(this.collectionName);
    return transaction.doc(id).update(
      {
        'Transaction_type': type,
        'Category': category,
        'Amount': amount,
        'date': date,
        'dateTime': datetime,
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
    return transaction.orderBy('dateTime', descending: true).snapshots();
  }
}