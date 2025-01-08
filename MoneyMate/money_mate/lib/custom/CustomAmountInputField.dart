import '../ImportAll.dart';

class CustomAmountInput extends StatelessWidget {
  const CustomAmountInput({
    super.key,
    required this.amountCon,
  });

  final TextEditingController amountCon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: amountCon,
      decoration: InputDecoration(
        hintText: 'Amount',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          FontAwesomeIcons.bangladeshiTakaSign,
          size: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}