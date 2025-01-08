import '../ImportAll.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Save',
      style: TextStyle(
        color: Colors.white,
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
