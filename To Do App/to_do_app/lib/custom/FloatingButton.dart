import 'package:to_do_app/helper/AllFile.dart';

class CustomFloatingButton extends StatelessWidget {
  List<Task> taskList;
  final Function AddTaskCallback;

  CustomFloatingButton(this.taskList, this.AddTaskCallback);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      backgroundColor: Colors.lightBlueAccent,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(
                taskList,
                (Task newTask) {
                  AddTaskCallback(newTask);
                },
              ),
            ),
          ),
        );

        // build(context);
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
