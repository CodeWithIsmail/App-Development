import 'package:medication_reminder/ImportAll.dart';

class CustomMedicineCard extends StatelessWidget {
  String name;
  String dosage;
  String type;
  String image;
  String day;
  String perday;
  String start;

  CustomMedicineCard(this.name, this.dosage, this.type, this.image, this.day,
      this.perday, this.start);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailsPage(name, dosage, type, image, day, perday, start),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey.shade100,
              child: Image.asset(
                image,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Text(
              '$day || $perday',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
