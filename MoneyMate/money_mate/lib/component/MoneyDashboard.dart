import '../ImportAll.dart';

class MoneyDashboard extends StatelessWidget {
  const MoneyDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Net Balance',
          style: NetBalTextStyle,
        ),
        Text(
          '13000',
          style: BalTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BalanceShowGroup(CupertinoIcons.up_arrow, Colors.lightGreenAccent,
                'Income', 2000),
            BalanceShowGroup(CupertinoIcons.down_arrow, Colors.red.shade900,
                'Expenses', 1000),
          ],
        )
      ],
    );
  }
}
