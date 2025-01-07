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

  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(colorScheme: colorList),
        // home: ExpenseChart(),
        home: AuthWrapper(),

        // initialRoute: RouteName.home,
        routes: allPageRoute,
      ),
    );
  }
}
