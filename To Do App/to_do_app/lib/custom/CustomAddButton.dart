import 'package:to_do_app/helper/AllFile.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback function;

  CustomAddButton(this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: kToolbarHeight,
        width: double.infinity,
        decoration: AddButtonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add', style: addButton),
          ],
        ),
      ),
    );
  }
}
