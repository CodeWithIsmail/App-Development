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

List<int> day = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
];

List<double> val = [
  100,
  150,
  50,
  300,
  200,
  30,
  20,
  100,
  150,
  300,
  100,
  150,
  50,
  300,
  200,
];

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

List<double> categoryExpense = [1000, 2000, 500, 900, 300, 1000, 3000, 5000];
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

// List<Map<String, dynamic>> TransactionData = [
//   {
//     'color': LinearGradient(
//       colors: [
//         Colors.pinkAccent.withOpacity(1.0), // High opacity
//         Colors.pinkAccent.withOpacity(0.6), // Low opacity
//       ],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     ),
//     'icon': FaIcon(
//       FontAwesomeIcons.burger,
//       color: Colors.white,
//     ),
//     'name': 'Food',
//     'amount': '-200',
//     'date': 'Today'
//   },
//   // {
//   //   'color': LinearGradient(
//   //     colors: [
//   //       Colors.purple.withOpacity(1.0), // High opacity
//   //       Colors.purple.withOpacity(0.85), // Low opacity
//   //     ],
//   //     begin: Alignment.topLeft,
//   //     end: Alignment.bottomRight,
//   //   ),
//   //   'icon': FaIcon(
//   //     FontAwesomeIcons.bagShopping,
//   //     color: Colors.white,
//   //   ),
//   //   'name': 'Shopping',
//   //   'amount': '-200',
//   //   'date': 'Today'
//   // },
//   // {
//   //   'color': LinearGradient(
//   //     colors: [
//   //       Colors.red.withOpacity(1.0), // High opacity
//   //       Colors.red.withOpacity(0.85), // Low opacity
//   //     ],
//   //     begin: Alignment.topLeft,
//   //     end: Alignment.bottomRight,
//   //   ),
//   //   'icon': FaIcon(
//   //     FontAwesomeIcons.heartCircleCheck,
//   //     color: Colors.white,
//   //   ),
//   //   'name': 'Health',
//   //   'amount': '-200',
//   //   'date': 'Today'
//   // },
//   // {
//   //   'color': LinearGradient(
//   //     colors: [
//   //       Colors.green.withOpacity(1.0), // High opacity
//   //       Colors.green.withOpacity(0.85), // Low opacity
//   //     ],
//   //     begin: Alignment.topLeft,
//   //     end: Alignment.bottomRight,
//   //   ),
//   //   'icon': FaIcon(
//   //     FontAwesomeIcons.book,
//   //     color: Colors.white,
//   //   ),
//   //   'name': 'Education',
//   //   'amount': '-200',
//   //   'date': 'Today'
//   // },
//   // {
//   //   'color': LinearGradient(
//   //     colors: [
//   //       Colors.brown.withOpacity(1.0), // High opacity
//   //       Colors.brown.withOpacity(0.85), // Low opacity
//   //     ],
//   //     begin: Alignment.topLeft,
//   //     end: Alignment.bottomRight,
//   //   ),
//   //   'icon': FaIcon(
//   //     FontAwesomeIcons.plane,
//   //     color: Colors.white,
//   //   ),
//   //   'name': 'Travel',
//   //   'amount': '-200',
//   //   'date': 'Today'
//   // },
// ];
