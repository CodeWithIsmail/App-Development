import 'package:to_do_app/helper/AllFile.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  CustomTextFormField(this.controller, this.hint);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(hintText: hint),
      controller: controller,
    );
  }
}
