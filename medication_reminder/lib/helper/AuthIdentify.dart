import '../ImportAll.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          String? username =
          FirebaseAuth.instance.currentUser?.email?.split('@')[0];
          // print(email);
          // FirestoreService firestoreService = FirestoreService(email!);
          return MainPage(username!);
        } else {
          return LoginOrRegistration();
        }
      },
    );
  }
}