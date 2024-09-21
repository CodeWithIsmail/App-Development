import '../ImportAll.dart';

//
// class FirestoreService {
//   final String collectionName;
//
//   FirestoreService(this.collectionName);
//
//   /*
//    final TextEditingController MedicineName = TextEditingController();
//   final TextEditingController quantity = TextEditingController();
//   final TextEditingController MedicineType = TextEditingController();
//   final TextEditingController DayGap = TextEditingController();
//   final TextEditingController StartDay = TextEditingController();
//   final TextEditingController DailyTimes = TextEditingController();
//    */
//
//   Future<void> addRecord(String MedicineName, String quantity,
//       String MedicineType, int DayGap, String StartDay, int DailyTimes) {
//     final CollectionReference medicine =
//         FirebaseFirestore.instance.collection(this.collectionName);
//     return medicine.add(
//       {
//         'MedicineName': MedicineName,
//         'Quantity': quantity,
//         'MedicineType': MedicineType,
//         'DayGap': DayGap,
//         'DailyTimes': DailyTimes,
//         'StartDay': StartDay,
//       },
//     );
//   }
//
//   Future<void> updateRecord(String id,String MedicineName, String quantity,
//       String MedicineType, int DayGap, String StartDay, int DailyTimes) {
//     final CollectionReference medicine =
//         FirebaseFirestore.instance.collection(this.collectionName);
//     return medicine.doc(id).update(
//       {
//         'MedicineName': MedicineName,
//         'Quantity': quantity,
//         'MedicineType': MedicineType,
//         'DayGap': DayGap,
//         'DailyTimes': DailyTimes,
//         'StartDay': StartDay,
//       },
//     );
//   }
//
//   Future<void> deleteRecord(String id) {
//     final CollectionReference medicine =
//         FirebaseFirestore.instance.collection(this.collectionName);
//     return medicine.doc(id).delete();
//   }
//
//   Stream<QuerySnapshot> getRecords() {
//     final CollectionReference medicine =
//         FirebaseFirestore.instance.collection(this.collectionName);
//     return medicine.orderBy('StartDay', descending: true).snapshots();
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final User? _currentUser = FirebaseAuth.instance.currentUser;
  String? username =
  FirebaseAuth.instance.currentUser?.email?.split('@')[0];

  Future<void> addRecord(
      {required String medicineName,
      required String quantity,
      required String medicineType,
      required int dayGap,
      required String startDay,
      required int dailyTimes}) async {
    try {
      await _firestore
          .collection('users')
          .doc(username)
          .collection('medicines')
          .add({
        'medicine_name': medicineName,
        'quantity': quantity,
        'medicine_type': medicineType,
        'day_gap': dayGap,
        'start_day': startDay,
        'daily_times': dailyTimes,
      });
      print('Medicine record added successfully.');
    } catch (e) {
      print('Error adding record: $e');
    }
  }

  Future<void> updateRecord(
      {required String id,
      required String medicineName,
      required String quantity,
      required String medicineType,
      required int dayGap,
      required String startDay,
      required int dailyTimes}) async {
    try {
      await _firestore
          .collection('users')
          .doc(username)
          .collection('medicines')
          .doc(id)
          .update({
        'medicine_name': medicineName,
        'quantity': quantity,
        'medicine_type': medicineType,
        'day_gap': dayGap,
        'start_day': startDay,
        'daily_times': dailyTimes,
      });
      print('Medicine record updated successfully.');
    } catch (e) {
      print('Error updating record: $e');
    }
  }

  Future<void> deleteRecord(String id) async {
    try {
      await _firestore
          .collection('users')
          .doc(username)
          .collection('medicines')
          .doc(id)
          .delete();
      print('Medicine record deleted successfully.');
    } catch (e) {
      print('Error deleting record: $e');
    }
  }

  Stream<QuerySnapshot> getRecords() {
    return _firestore
        .collection('users')
        .doc(username)
        .collection('medicines')
        .orderBy('start_day', descending: true)
        .snapshots();
  }
}
