import '../ImportAll.dart';

String? getCurrentUser() {
  String? email = FirebaseAuth.instance.currentUser?.email;
  return email!.substring(0, email.indexOf('@moneymate.com'));
}


