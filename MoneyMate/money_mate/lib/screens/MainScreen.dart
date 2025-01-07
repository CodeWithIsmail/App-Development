// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../ImportAll.dart';

class Mainscreen extends StatefulWidget {
  FirestoreService firestoreService;

  Mainscreen(this.firestoreService);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {


  void EditOrDelete(DocumentSnapshot document) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an option'),
          actions: <Widget>[
            TextButton(
              child: Text('Edit'),
              onPressed: () {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String Transaction_type = data['Transaction_type'];
                String Category = data['Category'];
                String date = data['date'];
                String amount = data['Amount'].toString() + ' TK';
                widget.firestoreService.deleteRecord(document.id);
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExpense('Edit', Transaction_type,
                        Category, amount, date, widget.firestoreService),
                  ),
                );
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                widget.firestoreService.deleteRecord(document.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           CircleAvatar(
            //             radius: 20,
            //             backgroundColor: Colors.grey.shade100,
            //             child: Image.asset('images/moneymate.png'),
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'MoneyMate',
            //                 style: welcomeTextStyle,
            //               ),
            //               Text(
            //                 widget.firestoreService.collectionName,
            //                 style: NameTextStyle,
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           IconButton(
            //             onPressed: () {
            //               FirebaseAuth.instance.signOut();
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => LoginOrRegistration(),
            //                 ),
            //               );
            //             },
            //             icon: Icon(
            //               Icons.logout_outlined,
            //               size: 23,
            //             ),
            //           ),
            //           IconButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => InfoScreen(),
            //                 ),
            //               );
            //             },
            //             icon: Icon(
            //               Icons.info_outline_rounded,
            //               size: 23,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 15),
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

                      return GestureDetector(
                        onDoubleTap: () {
                          if (Category != 'Initial Balance')
                            EditOrDelete(document);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 7, top: 7, left: 4, right: 6),
                          child: Container(
                            decoration: expenseTileDecoration,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            amount,
                                            style: ExpenseValTextStyle,
                                          ),
                                          Text(date,
                                              style: ExpenseDayTextStyle),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        child: IconType[Transaction_type],
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
