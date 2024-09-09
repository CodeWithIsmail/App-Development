// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import '../ImportAll.dart';

class Login extends StatefulWidget {
  void Function()? togglefunction;

  Login(this.togglefunction);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();

  void login() async {
    try {
      String username = uname.text.toLowerCase();
      final currentUser = await _auth.signInWithEmailAndPassword(
          email: uname.text.toLowerCase() + '@health.com',
          password: pass.text);
      if (currentUser != null) {
        print('email: $username');
        // FirestoreService firestoreService = FirestoreService(email);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(username),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      CustomToast('Invalid credential. Login failed.').ShowToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 55),
        decoration: BoxDecoration(gradient: gradient),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      MyTextField('Username', uname, false, 1),
                      SizedBox(height: 20),
                      MyTextField('Password', pass, true, 1),
                      SizedBox(height: 40),
                      MyButtonGestureDetector(login, 'Login'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?  ',
                            style: TextStyle(color: Colors.white),
                          ),
                          MyTextGestureDetector(
                            'Register here',
                            Colors.grey.shade100,
                            14,
                            true,
                            widget.togglefunction,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
