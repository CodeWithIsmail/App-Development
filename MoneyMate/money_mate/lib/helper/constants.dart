import '../ImportAll.dart';

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
  fontSize: 18,
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

final DashboardShadow=BoxShadow(
  color: Colors.grey.shade500,
  offset: Offset(5, 5),
  blurRadius: 10,
);

final expenseTileDecoration=BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade300,
      offset: Offset(5, 5),
      blurRadius: 2,
    ),
  ],
  borderRadius: BorderRadius.circular(15),
  color: Colors.white,
);

final colorList=ColorScheme.light(
  background: Colors.grey.shade100,
  onBackground: Colors.black,
  primary: Color(0xFF355C7D),
  secondary: Color(0xFF6C5B7B),
  tertiary: Color(0xFFC06C84),
);

const selectColor = Colors.lightBlueAccent;
const unselectColor = Colors.grey;