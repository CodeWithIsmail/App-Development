import 'package:to_do_app/helper/AllFile.dart';

class TopScreen extends StatefulWidget {
  int numberOfTask;

  TopScreen(this.numberOfTask);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            child: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
              size: 40,
            ),
            radius: 35,
            backgroundColor: Colors.white,
          ),
          Text(
            'To Do',
            style: heading1style,
          ),
          Row(
            children: [
              Text(
                widget.numberOfTask.toString(),
                style: heading6style,
              ),
              Text(
                widget.numberOfTask > 1 ? ' Tasks' : 'Task',
                style: heading6style,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
