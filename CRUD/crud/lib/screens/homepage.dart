import 'package:crud/all.dart';

class HomePage extends StatefulWidget {
  FirestoreService firestoreService;

  HomePage(this.firestoreService);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController noteController = TextEditingController();

  // FirestoreService firestoreService = FirestoreService(username);

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
                  widget.firestoreService.addNote(noteController.text);
                else
                  widget.firestoreService.updateNote(noteController.text, id);
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
    print('hello ');
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, PageName.log_or_regi);

                // Navigator.pop(context);
                // LoginOrRegistration();
              },
              child: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientBackGroundColor,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: widget.firestoreService.getNotes(),
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
                    padding:
                        const EdgeInsets.only(top: 15, left: 12, right: 12),
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
                                onTap: () =>
                                    widget.firestoreService.deleteNode(id),
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
