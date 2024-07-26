import '../ImportAll.dart';

class Record {
  LinearGradient linearGradient;
  FaIcon faIcon;
  String name;
  String date;
  String amount;

  Record(
    this.name,
    this.date,
    this.amount,
    this.linearGradient,
    this.faIcon,
  );
}

// List<Map<String, double>> categoryExpense = [
//   {'Food': 1000},
//   {'Shopping': 2000},
//   {'Education': 500},
//   {'Transport': 900},
//   {'Health': 300},
//   {'Travel': 1000},
//   {'Home': 3000},
//   {'Others': 5000},
// ];

List<String> Category = [
  'Shopping',
  'Food',
  'Education',
  'Home',
  'Transport',
  'Health',
  'Travel',
  'Others'
];
Map<String, Icon> IconMap = {
  'Food': Icon(FontAwesomeIcons.burger, color: Colors.white),
  'Shopping': Icon(FontAwesomeIcons.bagShopping, color: Colors.white),
  'Education': Icon(FontAwesomeIcons.book, color: Colors.white),
  'Transport': Icon(FontAwesomeIcons.bus, color: Colors.white),
  'Health': Icon(FontAwesomeIcons.heartCircleCheck, color: Colors.white),
  'Travel': Icon(FontAwesomeIcons.plane, color: Colors.white),
  'Home': Icon(FontAwesomeIcons.house, color: Colors.white),
  'Others': Icon(FontAwesomeIcons.moneyBill, color: Colors.white),
  'Saving': Icon(FontAwesomeIcons.bank, color: Colors.white),
  'Salary': Icon(FontAwesomeIcons.dollarSign, color: Colors.white),
  // 'Entertainment'
};

Map<String, Icon> IconType = {
  'Income': Icon(
    size: 20,
    CupertinoIcons.up_arrow,
    color: Colors.green,
  ),
  'Expense': Icon(
    size: 20,
    CupertinoIcons.down_arrow,
    color: Colors.red,
  ),

  // 'Entertainment'
};

Map<String, LinearGradient> ColorMap = {
  'Food': LinearGradient(
    colors: [
      Colors.pinkAccent.withOpacity(1.0), // High opacity
      Colors.pinkAccent.withOpacity(0.6), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Shopping': LinearGradient(
    colors: [
      Colors.purple.withOpacity(1.0),
      Colors.purple.withOpacity(0.85),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Education': LinearGradient(
    colors: [
      Colors.green.withOpacity(1.0), // High opacity
      Colors.green.withOpacity(0.85), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Transport': LinearGradient(
    colors: [
      Colors.brown.withOpacity(1.0), // High opacity
      Colors.brown.withOpacity(0.85), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Health': LinearGradient(
    colors: [
      Colors.red.withOpacity(1.0), // High opacity
      Colors.red.withOpacity(0.85), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Travel': LinearGradient(
    colors: [
      Colors.blueGrey.withOpacity(1.0), // High opacity
      Colors.blueGrey.withOpacity(0.85), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Home': LinearGradient(
    colors: [
      Colors.lightBlueAccent.withOpacity(1.0), // High opacity
      Colors.lightBlueAccent.withOpacity(0.6), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Others': LinearGradient(
    colors: [
      Colors.deepPurpleAccent.withOpacity(1.0), // High opacity
      Colors.deepPurpleAccent.withOpacity(0.6), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Saving': LinearGradient(
    colors: [
      Colors.greenAccent.withOpacity(1.0), // High opacity
      Colors.greenAccent.withOpacity(0.6), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'Salary': LinearGradient(
    colors: [
      Colors.lightBlueAccent.withOpacity(1.0), // High opacity
      Colors.lightBlueAccent.withOpacity(0.6), // Low opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
};
