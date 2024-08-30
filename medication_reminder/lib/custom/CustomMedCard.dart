import 'package:medication_reminder/ImportAll.dart';

class CustomMedCard extends StatelessWidget {
  String name;
  String image;

  CustomMedCard(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        // color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
