import 'package:crud/all.dart';

const gradientColor = LinearGradient(
  colors: [
    Color(0xFF355C7D),
    Color(0xFF6C5B7B),
    Color(0xFFC06C84),
  ],
);

const gradientBackGroundColor = LinearGradient(
  colors: [
    Color(0xFF74ebd5),
    Color(0xFFACB6E5),
  ],
  // transform: GradientRotation(pi / 2),
);

final boxShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 5,
  color: Colors.grey.shade500,
);

const titleStyle = TextStyle(
  color: Colors.white,
);

const subtitleStyle = TextStyle(
  color: Colors.lightGreenAccent,
);
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
final forgetPassStyle = TextStyle(
  color: Colors.grey.shade100,
  fontSize: 14,
);
final gradient = LinearGradient(
  colors: [Colors.blueAccent, Colors.lightBlueAccent],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

class PageName {

  static final home = 'home';
  static final log_or_regi = 'log_or_regi';
}
