import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:to_do_app/helper/AllFile.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleCon = TextEditingController();
    TextEditingController subtitleCon = TextEditingController();

    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              'Add new task',
              style: addTaskStyle,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 40,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              controller: titleCon,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 20,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Details',
              ),
              controller: subtitleCon,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 15,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  tasks.add(
                    Task(titleCon.text, subtitleCon.text, false),
                  );
                });
              },
              child: Container(
                height: kToolbarHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add',
                      style: addButton,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
