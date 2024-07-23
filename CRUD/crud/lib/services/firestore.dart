import 'package:crud/all.dart';

class FirestoreService {
  final String collectionName;

  FirestoreService(this.collectionName);

  Future<void> addNote(String note) {
    final CollectionReference notes =
        FirebaseFirestore.instance.collection(this.collectionName);
    return notes.add(
      {
        'note': note,
        'time': DateFormat('dd-MMM-yy HH:mm').format(DateTime.now()),
      },
    );
  }

  Future<void> updateNote(String note, String id) {
    final CollectionReference notes =
        FirebaseFirestore.instance.collection(this.collectionName);
    return notes.doc(id).update(
      {
        'note': note,
        'time': DateFormat('dd-MMM-yy HH:mm').format(DateTime.now()),
      },
    );
  }

  Future<void> deleteNode(String id) {
    final CollectionReference notes =
        FirebaseFirestore.instance.collection(this.collectionName);
    return notes.doc(id).delete();
  }

  Stream<QuerySnapshot> getNotes() {
    final CollectionReference notes =
        FirebaseFirestore.instance.collection(this.collectionName);
    return notes.orderBy('time', descending: true).snapshots();
  }
}
