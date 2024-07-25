import 'package:money_mate/ImportAll.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          String? email =
              FirebaseAuth.instance.currentUser?.email?.split('@')[0];
          print(email);
          FirestoreService firestoreService = FirestoreService(email!);
          return Homescreen(firestoreService);
        } else {
          return LoginOrRegistration();
        }
      },
    );
  }
}
