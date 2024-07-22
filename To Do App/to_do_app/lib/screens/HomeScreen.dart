// ignore_for_file: prefer_const_constructors
import 'package:to_do_app/helper/AllFile.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  List<Task> tasks = [
    Task('app dev', 'done todoapp', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: CustomFloatingButton(
        tasks,
        (Task newTask) {
          print('main: ' + newTask.title);
          setState(() {
            tasks.add(newTask);
          });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopScreen(tasks.length),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              decoration: listDecoration,
              child: TaskListScreen(tasks),
            ),
          ),
        ],
      ),
    );
  }
}
