import 'package:crud/all.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('images/note.png', width: 100, height: 100),
        SizedBox(height: 20),
        Text('QuickNote', style: appNameTextStyle),
        SizedBox(height: 40),
      ],
    );
  }


}
