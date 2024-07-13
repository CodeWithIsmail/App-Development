import 'package:health_tracker/all.dart';

final Map<String, WidgetBuilder> allPageRoute = {
  PageName.welcome: (context) => WelcomeScreen(),
  PageName.log: (context) => Login(),
  PageName.regi: (context) => Registration(),
  PageName.home: (context) => HomePage(),
  PageName.profile: (context) => Profilepage(),
  PageName.record: (context) => Recordpage(),
  PageName.blood: (context) => Bloodbank(),
  PageName.consult: (context) => Doctorconsult(),
  PageName.about: (context) => About(),
};