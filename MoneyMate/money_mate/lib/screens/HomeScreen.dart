// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../ImportAll.dart';

class Homescreen extends StatefulWidget {
  FirestoreService firestoreService;

  Homescreen(this.firestoreService);

  @override
  State<Homescreen> createState() => _HomescreenState();
}


class _HomescreenState extends State<Homescreen> {

  int index = 0;
  String uname="";
  @override
  void initState() {
    String? email = FirebaseAuth.instance.currentUser?.email;
    uname = email!.substring(0, email.indexOf('@'));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade100,
            child: Image.asset('images/moneymate.png'),
          ),
        ),
        leadingWidth: 50,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MoneyMate',
              style: welcomeTextStyle,
            ),
            Text(
              uname,
              style: NameTextStyle,
            ),
          ],
        ),
        actions: [
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.info_outline_rounded,
              size: 23,
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: index == 0 ? selectColor : unselectColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_rounded,
                color: index == 1 ? selectColor : unselectColor,
              ),
              label: 'Stats',
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExpense(
                  'Add', 'Expense', 'Food', '', '', widget.firestoreService),
            ),
          );
        },
        child: CustomFloatingButton(),
        shape: CircleBorder(),
      ),
      body: index == 0
          ? Mainscreen(widget.firestoreService) :ExpenseChart(),
          // : Showgraph(widget.firestoreService),
    );
  }
}
