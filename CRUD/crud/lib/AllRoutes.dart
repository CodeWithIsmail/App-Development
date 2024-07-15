import 'all.dart';

final Map<String, WidgetBuilder> allPageRoute = {
  PageName.log: (context) => Login(),
  PageName.reg: (context) => Register(),
  PageName.home: (context) => HomePage(),
};
