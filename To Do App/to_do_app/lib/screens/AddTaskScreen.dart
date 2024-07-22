import 'package:to_do_app/helper/AllFile.dart';

class AddTaskScreen extends StatelessWidget {
  List<Task> taskList;
  final Function AddTaskCallBack;

  AddTaskScreen(
    this.taskList,
    this.AddTaskCallBack,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCon = TextEditingController();
    TextEditingController subtitleCon = TextEditingController();

    void addTask() {
      AddTaskCallBack(Task(titleCon.text, subtitleCon.text, false));

    }

    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      width: double.infinity,
      decoration: listDecoration,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text('Add new task', style: addTaskStyle),
            SizedBox(height: MediaQuery.sizeOf(context).height / 40),
            CustomTextFormField(titleCon, 'Title'),
            SizedBox(height: MediaQuery.sizeOf(context).height / 20),
            CustomTextFormField(subtitleCon, 'Details'),
            SizedBox(height: MediaQuery.sizeOf(context).height / 15),
            CustomAddButton(addTask),
          ],
        ),
      ),
    );
  }
}
