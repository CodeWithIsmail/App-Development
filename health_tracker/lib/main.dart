import 'package:flutter/material.dart';
import 'package:health_tracker/HomePage.dart';
import 'constants.dart';
import 'ProfilePage.dart';
import 'RecordPage.dart';
import 'DoctorConsult.dart';
import 'BloodBank.dart';
import 'About.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/profile': (context) => Profilepage(),
        '/record': (context) => Recordpage(),
        '/blood': (context) => Bloodbank(),
        '/consult': (context) => Doctorconsult(),
        '/about': (context) => About(),

      },
      initialRoute: '/home',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade300,
          centerTitle: true,
          titleTextStyle: KAppBarTextStyle,

          // color: Colors.lightGreenAccent,
        ),
      ),
      // home: HomePage(),
    );
  }
}
