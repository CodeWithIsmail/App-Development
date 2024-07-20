// ignore_for_file: prefer_const_constructors

import 'package:crud/all.dart';

class Register extends StatefulWidget {
  void Function()? togglefunction;

  Register(this.togglefunction);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  TextEditingController name = TextEditingController();
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conpass = TextEditingController();

  void regi() async {
    try {
      if (pass.text != conpass.text) {
        CustomToast('Password don\'t match').ShowToast();
      } else {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: uname.text.toLowerCase() + '@quicknote.com',
            password: pass.text);
        String email = uname.text.toLowerCase();

        if (newUser != null) {
          FirestoreService firestoreService = FirestoreService(email);
          // Navigator.pushNamed(context, PageName.home);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(firestoreService),
            ),
          );
          // Navigator.pushNamed(context, PageName.home);
        } else {}
      }
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 55),
        decoration: BoxDecoration(
          gradient: gradient,
        ),
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
                      MyTextField('Name', name, false),
                      SizedBox(height: 20),
                      MyTextField('Username', uname, false),
                      SizedBox(height: 20),
                      MyTextField('Password', pass, true),
                      SizedBox(height: 20),
                      MyTextField('Confirm Password', conpass, true),
                      SizedBox(height: 40),
                      MyButtonGestureDetector(regi, 'Register'),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?  ',
                            style: TextStyle(color: Colors.white),
                          ),
                          MyTextGestureDetector(
                            'Login here',
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
