import 'package:money_mate/ImportAll.dart';

class BalanceShowGroup extends StatelessWidget {
  IconData iconName;
  Color iconColor;
  String text;
  int amount;

  BalanceShowGroup(this.iconName, this.iconColor, this.text, this.amount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          child: Icon(
            size: 20,
            iconName,
            color: iconColor,
          ),
          backgroundColor: Colors.white.withOpacity(0.3),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TitleTextStyle,
            ),
            Text(
              amount.toString(),
              style: ValueTextStyle,
            ),
          ],
        )
      ],
    );
  }
}
