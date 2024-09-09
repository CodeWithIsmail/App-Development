import 'package:medication_reminder/Screens/AddScreen.dart';

import '../ImportAll.dart';

class MainPage extends StatefulWidget {
  String username;

  MainPage(this.username);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // LocalNotification.showSimpleNotification(
          //     title: 'It\'s medication time',
          //     body: 'Take this medicine',
          //     payload: 'This is a simple notification');

          // LocalNotification.showPeriodicNotification(
          //     title: 'It\'s medication time',
          //     body: 'Take this medicine',
          //     payload: 'This is a simple notification');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMed(),
            ),
          );
        },
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 10),
          scrollDirection: Axis.vertical,
          children: [
            CustomMedicineCard('Napa', '500 mg', 'Tablet', 'images/pill.png',
                'Every day', '3 Times', '23 Jul-24 8:30pm'),
            CustomMedicineCard('Syrup', '500 mg', 'Syrup', 'images/syrup.png',
                'Every day', '2 Times', '23 Jul-24 8:30pm'),
            CustomMedicineCard(
                'Lotion',
                '500 mg',
                'Lotion',
                'images/lotion.png',
                'Every day',
                '2 Times',
                '23 Jul-24 8:30pm'),
            CustomMedicineCard(
                'Inhaler',
                '500 mg',
                'Inhaler',
                'images/inhaler.png',
                'Every day',
                '2 Times',
                '23 Jul-24 8:30pm'),
            CustomMedicineCard(
                'Syringe',
                '500 mg',
                'Syringe',
                'images/syringe.png',
                'Every day',
                '2 Times',
                '23 Jul-24 8:30pm'),
            CustomMedicineCard('Syrup', '500 mg', 'Syrup', 'images/syrup.png',
                'Every day', '2 Times', '23 Jul-24 8:30pm'),
            CustomMedicineCard('Drops', '500 mg', 'Drops', 'images/drops.png',
                'Every day', '2 Times', '23 Jul-24 8:30pm'),
            CustomMedicineCard(
                'Medicine',
                '500 mg',
                'Medicine',
                'images/medicine.png',
                'Every day',
                '2 Times',
                '23 Jul-24 8:30pm'),
            CustomMedicineCard('Syrup', '500 mg', 'Syrup', 'images/syrup.png',
                'Every day', '2 Times', '23 Jul-24 8:30pm'),
            CustomMedicineCard('Syrup', '500 mg', 'Syrup', 'images/syrup.png',
                'Every day', '2 Times', '23 Jul-24 8:30pm'),
          ],
        ),
      ),
    );
  }
}
