import '../ImportAll.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();

  Homescreen({super.key});
}

class _HomescreenState extends State<Homescreen> {
  int index = 0;
  String uname = "";
  late FirestoreService firestoreService;

  @override
  void initState() {
    uname = getCurrentUser() ?? "";
    firestoreService = FirestoreService(uname);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
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
              builder: (context) => HandleTransaction(
                  'Add', 'Expense', 'Food', '', ''),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const CustomFloatingButton(),
      ),
      body: index == 0 ? Mainscreen(firestoreService) : ExpenseChartBuilder(),
    );
  }
}
