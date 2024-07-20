import 'package:to_do_app/helper/AllFile.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomListTile(
            tasks[index].title, tasks[index].subtitle, tasks[index].stateValue,
                (current) {
              setState(() {
                tasks[index].toogleState();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}