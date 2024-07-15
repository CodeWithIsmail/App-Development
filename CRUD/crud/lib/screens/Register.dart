// ignore_for_file: prefer_const_constructors

import 'package:crud/all.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  void regi() {}

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController uname = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController conpass = TextEditingController();

    return Scaffold(
      body: Container(
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
                            () => Navigator.pushNamed(context, PageName.log),
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
