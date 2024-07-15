import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crud/services/firestore.dart';

import '../custom/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController noteController = TextEditingController();
  FirestoreService firestoreService = FirestoreService();

  void showMyDialog(String? id, String title) {
    showDialog(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: TextField(
              controller: noteController,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (noteController.text == '') return;
                if (id == null)
                  firestoreService.addNote(noteController.text);
                else
                  firestoreService.updateNote(noteController.text, id);
                noteController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          showMyDialog(null, 'Add new note');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text(
          'Note App',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientBackGroundColor,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;
              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot document = notesList[index];
                  String id = document.id;

                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;

                  String currentNote = data['note'];
                  String time = data['time'].toString();

                  return Padding(
                    padding: const EdgeInsets.only(top:15,left: 12,right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          boxShadow,
                        ],
                        gradient: gradientColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: ListTile(
                          title: Text(
                            textAlign: TextAlign.left,
                            currentNote,
                            style: titleStyle,
                          ),
                          subtitle: Text(
                            time,
                            style: subtitleStyle,
                          ),
                          leading: Icon(
                            Icons.note,
                            color: Colors.white,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => firestoreService.deleteNode(id),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => showMyDialog(id, 'Update note'),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text('No notes...');
            }
          },
        ),
      ),
      // body:,
    );
  }
}
