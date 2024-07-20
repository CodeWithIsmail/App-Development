import 'package:to_do_app/helper/AllFile.dart';

class CustomListTile extends StatelessWidget {
  String title, subtitle;
  bool stateValue;
  Function changeState;

  CustomListTile(this.title, this.subtitle, this.stateValue, this.changeState);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration:
              stateValue ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Checkbox(
        value: stateValue,
        activeColor: Colors.lightBlueAccent,
        onChanged: (newvalue) {
          changeState(newvalue);
        },
      ),
    );
  }
}
