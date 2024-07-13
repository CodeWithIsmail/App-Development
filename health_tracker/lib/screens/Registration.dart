// ignore_for_file: prefer_const_constructors

import 'package:health_tracker/all.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  String email = '', password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: GradientMain,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  cursorColor: Colors.black,
                  style: InputTextStyle,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                    print(email);
                  },
                  decoration: CustomInputDecoration('Enter your email'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  style: InputTextStyle,
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                  decoration: CustomInputDecoration('Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                CustomElevatedButton(
                  Colors.blue,
                  Colors.white,
                  'Register',
                  () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, PageName.home);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
