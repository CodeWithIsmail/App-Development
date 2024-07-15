import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String note) {
    return notes.add(
      {
        'note': note,
        'time': DateFormat('dd-MMM-yy HH:mm').format(DateTime.now()),
      },
    );
  }

  Future<void> updateNote(String note, String id) {
    return notes.doc(id).update(
      {
        'note': note,
        'time': DateFormat('dd-MMM-yy HH:mm').format(DateTime.now()),
      },
    );
  }

  Future<void> deleteNode(String id) {
    return notes.doc(id).delete();
  }

  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('time', descending: true).snapshots();
  }
}
