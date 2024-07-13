import 'all.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme:
          ColorScheme.light(
            background: Colors.grey.shade100,
            onBackground: Colors.black,
            primary:Color(0xFF355C7D),
            secondary: Color(0xFF6C5B7B),
            tertiary: Color(0xFFC06C84),
          )
      ),
      home: Homescreen(),

    );
  }
}
