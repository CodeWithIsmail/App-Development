import '../ImportAll.dart';

class Showgraph extends StatelessWidget {
  const Showgraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category wise Expense Bar Chart',
                style: TransactionTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: MyChart(),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Date wise Expense Bar Chart',
                style: TransactionTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: MyChart2(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
