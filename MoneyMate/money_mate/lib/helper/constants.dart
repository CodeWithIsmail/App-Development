import '../ImportAll.dart';

final appNameTextStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black26,
      offset: Offset(3.0, 3.0),
    ),
  ],
);

final gradient = LinearGradient(
  colors: [
    Color(0xFF355C7D),
    Color(0xFF6C5B7B),
    Color(0xFFC06C84),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const welcomeTextStyle = TextStyle(
  color: Colors.blueGrey,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

const NameTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const NetBalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
  // fontWeight: FontWeight.bold,
);

const BalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const TitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 10,
  // fontWeight: FontWeight.bold,
);

const ValueTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  // fontWeight: FontWeight.bold,
);

const ExpensesTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const ViewAllTextStyle = TextStyle(
  color: Colors.blueGrey,
  fontSize: 15,
  fontWeight: FontWeight.w400,
);

const ExpenseTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 17,
  fontWeight: FontWeight.w500,
);
const ExpenseValTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
const ExpenseDayTextStyle = TextStyle(
  color: Colors.blueGrey,
  fontSize: 15,
  fontWeight: FontWeight.w400,
);
const addTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);
const TransactionTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const customGradient = LinearGradient(
  colors: [
    Color(0xFF355C7D),
    Color(0xFF6C5B7B),
    Color(0xFFC06C84),
  ],
);

const DashboardGradient = LinearGradient(
  colors: [
    Color(0xFF355C7D),
    Color(0xFF6C5B7B),
    Color(0xFFC06C84),
  ],
  transform: GradientRotation(pi / 4),
);

final DashboardShadow = BoxShadow(
  color: Colors.grey.shade500,
  offset: Offset(5, 5),
  blurRadius: 10,
);

final expenseTileDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade400,
      offset: Offset(1, 3),
      blurRadius: 5,
    ),
  ],
);

final colorList = ColorScheme.light(
  background: Colors.grey.shade100,
  onBackground: Colors.black,
  primary: Color(0xFF355C7D),
  secondary: Color(0xFF6C5B7B),
  tertiary: Color(0xFFC06C84),
);
final barGradient = LinearGradient(
  colors: [
    Color(0xFF355C7D),
    Color(0xFF6C5B7B),
    Color(0xFFC06C84),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

final barChartLeftStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);
final barChartBottomStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 7,
);
const selectColor = Colors.lightBlueAccent;
const unselectColor = Colors.grey;
