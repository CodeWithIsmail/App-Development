import '../ImportAll.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: customGradient,
      ),
      child: Icon(
        CupertinoIcons.add,
      ),
    );
  }
}
