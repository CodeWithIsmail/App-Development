import '../ImportAll.dart';

class RouteName {
  static final add = 'add';
  static final home = 'homescreen';
}

List<Record> Transaction = [
  Record(
    'Shopping',
    'Today',
    '200',
    LinearGradient(
      colors: [
        Colors.purple.withOpacity(1.0), // High opacity
        Colors.purple.withOpacity(0.85), // Low opacity
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
  ),
];

final Map<String, WidgetBuilder> allPageRoute = {
  RouteName.add: (context) => AddExpense(
        (newRecord) {
          Transaction.add(newRecord);
// print(newRecord.name + ' , ' + newRecord.date);
        },
      ),
  RouteName.home: (context) => Homescreen(Transaction),
};
