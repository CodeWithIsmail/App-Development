import '../ImportAll.dart';

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

  // Helper function to validate username format
  bool _isValidUsername(String username) {
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9]+$');
    return usernameRegExp.hasMatch(username);
  }

  void regi() async {
    try {
      if (name.text.isEmpty ||
          uname.text.isEmpty ||
          pass.text.isEmpty ||
          conpass.text.isEmpty) {
        CustomToast('All fields must be filled').ShowToast();
        return;
      }

      if (!_isValidUsername(uname.text)) {
        CustomToast('Username must contain only letters and numbers')
            .ShowToast();
        return;
      }

      if (pass.text.length < 6) {
        CustomToast('Password must be at least 6 characters').ShowToast();
        return;
      }

      if (pass.text != conpass.text) {
        CustomToast('Passwords don\'t match').ShowToast();
        return;
      }

      final newUser = await _auth.createUserWithEmailAndPassword(
        email: uname.text.toLowerCase() + '@health.com',
        password: pass.text,
      );

      String username = uname.text.toLowerCase();

      if (newUser != null) {
        // DateTime now = DateTime.now();
        // DateFormat dateFormat = DateFormat('dd-MMM-yy');
        // String currentDate = dateFormat.format(now);
        // FirestoreService firestoreService = FirestoreService(email);
        // firestoreService.addRecord(
        //   'Income',
        //   'Initial Balance',
        //   int.parse(initialBal.text),
        //   currentDate,
        //   now,
        // );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(username),
          ),
        );
      } else {
        CustomToast('Registration failed. Please try again.').ShowToast();
      }
    } on FirebaseAuthException catch (e) {
      CustomToast('Username already exists. Try another username.').ShowToast();
    }
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
                      MyTextField('Name', name, false, 1),
                      SizedBox(height: 20),
                      MyTextField('Username', uname, false, 1),
                      SizedBox(height: 20),
                      MyTextField('Password', pass, true, 1),
                      SizedBox(height: 20),
                      MyTextField('Confirm Password', conpass, true, 1),
                      SizedBox(height: 20),
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
