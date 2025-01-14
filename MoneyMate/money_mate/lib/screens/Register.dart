import 'package:money_mate/ImportAll.dart';

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
  TextEditingController initialBal = TextEditingController();

  bool _isValidUsername(String username) {
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9]+$');
    return usernameRegExp.hasMatch(username);
  }

  void regi() async {
    try {
      if (name.text.isEmpty ||
          uname.text.isEmpty ||
          pass.text.isEmpty ||
          conpass.text.isEmpty ||
          initialBal.text.isEmpty) {
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
      String email = uname.text.toLowerCase();

      await _auth.createUserWithEmailAndPassword(
        email: '$email@moneymate.com',
        password: pass.text,
      );

      DateTime now = DateTime.now();
      DateFormat dateFormat = DateFormat('dd-MMM-yy');
      String currentDate = dateFormat.format(now);
      FirestoreService firestoreService = FirestoreService(email);
      firestoreService.addRecord(
        'Income',
        'Initial Balance',
        int.parse(initialBal.text),
        currentDate,
        now,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      CustomToast('Username already exists. Try another username.').ShowToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 55),
        decoration: const BoxDecoration(
          gradient: gradient,
        ),
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
                      MyTextField('Name', name, false, 1),
                      const SizedBox(height: 20),
                      MyTextField('Username', uname, false, 1),
                      const SizedBox(height: 20),
                      MyTextField('Password', pass, true, 1),
                      const SizedBox(height: 20),
                      MyTextField('Confirm Password', conpass, true, 1),
                      const SizedBox(height: 20),
                      MyTextField('Current balance', initialBal, true, 0),
                      const SizedBox(height: 40),
                      MyButtonGestureDetector(regi, 'Register'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
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
