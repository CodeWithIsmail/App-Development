import 'package:to_do_app/helper/AllFile.dart';

class TaskListScreen extends StatefulWidget {
  List<Task> taskList;

  TaskListScreen(this.taskList);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomListTile(
            widget.taskList[index].title,  widget.taskList[index].subtitle,  widget.taskList[index].stateValue,
                (current) {
              setState(() {
                widget.taskList[index].toogleState();
              });
            });
      },
      itemCount:  widget.taskList.length,
    );
  }
}