// ignore_for_file: prefer_const_constructors
import 'package:to_do_app/helper/AllFile.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: CustomFloatingButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopScreen(tasks.length),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              decoration: listDecoration,
              child: TaskListScreen(),
            ),
          ),
        ],
      ),
    );
  }
}

