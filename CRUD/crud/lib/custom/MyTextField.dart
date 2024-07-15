import 'package:crud/all.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  String hint;
  TextEditingController controll;
  bool obscure;

  MyTextField(this.hint, this.controll, this.obscure);

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controll,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obscure,
    );
  }
}
