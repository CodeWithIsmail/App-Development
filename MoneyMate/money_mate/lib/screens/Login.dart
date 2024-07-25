// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:money_mate/ImportAll.dart';

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

  void ForgetPass() {}

  void login() async {
    try {
      String email = uname.text.toLowerCase();
      final currentUser = await _auth.signInWithEmailAndPassword(
          email: uname.text.toLowerCase() + '@moneymate.com',
          password: pass.text);
      if (currentUser != null) {
        print('email: $email');
        FirestoreService firestoreService = FirestoreService(email);
        // Navigator.pushNamed(context, PageName.home);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homescreen(firestoreService),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          CustomToast('No user found for that username').ShowToast();
          break;
        case 'wrong-password':
          CustomToast('Wrong password provided').ShowToast();
          break;
        default:
          CustomToast('An unexpected error occurred. Please try again')
              .ShowToast();
      }
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
                      MyTextField('Username', uname, false,1),
                      SizedBox(height: 20),
                      MyTextField('Password', pass, true,1),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyTextGestureDetector('Forget Password?',
                              Colors.grey.shade100, 14, true, ForgetPass),
                        ],
                      ),
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
