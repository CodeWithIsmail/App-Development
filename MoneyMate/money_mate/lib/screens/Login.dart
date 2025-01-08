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
      String email = uname.text.toLowerCase();
      await _auth.signInWithEmailAndPassword(
          email: '$email@moneymate.com', password: pass.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      CustomToast('Invalid credential. Login failed.').ShowToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 55),
        decoration: const BoxDecoration(gradient: gradient),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIcon(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      MyTextField('Username', uname, false, 1),
                      const SizedBox(height: 20),
                      MyTextField('Password', pass, true, 1),
                      const SizedBox(height: 40),
                      MyButtonGestureDetector(login, 'Login'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
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
