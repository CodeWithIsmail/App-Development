import 'all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: allPageRoute,
      initialRoute: PageName.welcome,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade300,
          centerTitle: true,
          titleTextStyle: KAppBarTextStyle,
        ),
      ),
    );
  }
}
