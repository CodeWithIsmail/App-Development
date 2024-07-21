import '../ImportAll.dart';

class RouteName {
  static final add = 'add';
  static final home = 'homescreen';
}

final Map<String, WidgetBuilder> allPageRoute = {
  RouteName.add: (context) => AddExpense(),
  RouteName.home: (context) => Homescreen(),
};
