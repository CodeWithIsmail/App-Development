// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../ImportAll.dart';

class Mainscreen extends StatefulWidget {
  FirestoreService firestoreService;

  Mainscreen(this.firestoreService);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: welcomeTextStyle,
                      ),
                      Text(
                        widget.firestoreService.collectionName,
                        style: NameTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginOrRegistration(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.logout_outlined,
                          size: 23,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline_rounded,
                          size: 23,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: DashboardGradient,
                boxShadow: [DashboardShadow],
              ),
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: MoneyDashboard(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: ExpensesTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: widget.firestoreService.getRecords(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('An error occurred!'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData) {
                    return Center(child: Text('No records found.'));
                  }

                  List transactionList = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: transactionList.length,
                    itemBuilder: (context, int index) {
                      DocumentSnapshot document = transactionList[index];
                      String id = document.id;

                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      String Transaction_type = data['Transaction_type'];
                      String Category = data['Category'];
                      String amount = data['Amount'].toString() + ' TK';
                      String date = data['date'];

                      // print(Category + ',' + date);

                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 7, top: 7, left: 4, right: 4),
                        child: Container(
                          decoration: expenseTileDecoration,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: ColorMap[Category],
                                        shape: BoxShape.circle,
                                      ),
                                      width: 45,
                                      height: 45,
                                      alignment: Alignment.center,
                                      child: IconMap[Category],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      Category,
                                      style: ExpenseTitleTextStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      amount,
                                      style: ExpenseValTextStyle,
                                    ),
                                    Text(date, style: ExpenseDayTextStyle),
                                  ],
                                ),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: Icon(
                                //     Icons.edit,
                                //     size: 15,
                                //   ),
                                // ),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: Icon(
                                //     Icons.delete,
                                //     size: 15,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
