// ignore_for_file: prefer_const_constructors

import 'package:health_tracker/all.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: GradientMain,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomElevatedButton(
                  Colors.purple,
                  Colors.white,
                  'Log In',
                  () => Navigator.pushNamed(context, PageName.log),
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  Colors.blue,
                  Colors.white,
                  'Register',
                  () => Navigator.pushNamed(context, PageName.regi),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
