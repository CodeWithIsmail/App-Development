import 'ImportAll.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await initializeNotifications();
  await requestNotificationPermissions();
  await scheduleDailyNotification();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait
    // DeviceOrientation.landscapeLeft, // Lock to landscape
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.portraitDown, // If you need to lock both portrait directions
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(colorScheme: colorList),
      // home: ExpenseChart(),
      home: AuthWrapper(),

      // initialRoute: RouteName.home,
      routes: allPageRoute,
    );
  }
}
