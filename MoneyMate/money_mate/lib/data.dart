import 'all.dart';

List<Map<String, dynamic>> TransactionData = [
  {
    'color': LinearGradient(
      colors: [
        Colors.pinkAccent.withOpacity(1.0), // High opacity
        Colors.pinkAccent.withOpacity(0.6), // Low opacity
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'icon': FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    'name': 'Food',
    'amount': '-200',
    'date': 'Today'
  },
  {
    'color': LinearGradient(
      colors: [
        Colors.purple.withOpacity(1.0), // High opacity
        Colors.purple.withOpacity(0.85), // Low opacity
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'icon': FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    'name': 'Shopping',
    'amount': '-200',
    'date': 'Today'
  },
  {
    'color': LinearGradient(
      colors: [
        Colors.red.withOpacity(1.0), // High opacity
        Colors.red.withOpacity(0.85), // Low opacity
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'icon': FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    'name': 'Health',
    'amount': '-200',
    'date': 'Today'
  },
  {
    'color': LinearGradient(
      colors: [
        Colors.green.withOpacity(1.0), // High opacity
        Colors.green.withOpacity(0.85), // Low opacity
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'icon': FaIcon(
      FontAwesomeIcons.book,
      color: Colors.white,
    ),
    'name': 'Education',
    'amount': '-200',
    'date': 'Today'
  },
  {
    'color': LinearGradient(
      colors: [
        Colors.brown.withOpacity(1.0), // High opacity
        Colors.brown.withOpacity(0.85), // Low opacity
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'icon': FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    'name': 'Travel',
    'amount': '-200',
    'date': 'Today'
  },
];
