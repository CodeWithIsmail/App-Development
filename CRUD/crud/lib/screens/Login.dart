// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crud/all.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();

  void ForgetPass() {}

  void login() {
    HomePage();
  }

  @override
  Widget build(BuildContext context) {
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
                      MyTextField('Username', uname, false),
                      SizedBox(height: 20),
                      MyTextField('Password', pass, true),
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
                            () => Navigator.pushNamed(context, PageName.reg),
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
