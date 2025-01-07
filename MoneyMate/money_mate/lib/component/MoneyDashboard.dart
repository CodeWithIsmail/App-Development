import '../ImportAll.dart';

class MoneyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Net Balance',
          style: NetBalTextStyle,
        ),
        Text(
          transactionProvider.netBalance.toString(),
          style: BalTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BalanceShowGroup(CupertinoIcons.down_arrow, Colors.red.shade900,
                'Expense', transactionProvider.expense),
            BalanceShowGroup(CupertinoIcons.up_arrow, Colors.lightGreenAccent,
                'Income', transactionProvider.income),
          ],
        )
      ],
    );
  }
}
