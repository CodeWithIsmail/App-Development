import 'ImportAll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(colorScheme: colorList),
      initialRoute: RouteName.home,
      routes: allPageRoute,
    );
  }
}
