import 'package:flutter/material.dart';
import 'package:check_weather/screens/loading_screen.dart';
import 'package:check_weather/screens/city_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
      // LoadingScreen(),
    );
  }
}
