import 'package:medication_reminder/ImportAll.dart';

class AddMed extends StatefulWidget {
  const AddMed({super.key});

  @override
  State<AddMed> createState() => _AddMedState();
}

class _AddMedState extends State<AddMed> {
  final TextEditingController _timesController = TextEditingController();
  int _numberOfTimes = 0;

  List<Widget> _buildTimePickers() {
    List<Widget> timePickers = [];
    for (int i = 0; i < _numberOfTimes; i++) {
      timePickers.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFormField(
            readOnly: true,
            onTap: () async {
              TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (selectedTime != null) {
                // You can store the selected time in a list or map if needed
                // and update the corresponding TextFormField
              }
            },
            decoration: InputDecoration(
              hintText: 'Time ${i + 1}',
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.access_time_filled_outlined,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      );
    }
    return timePickers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        size: 30,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      'Add new',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 0),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Medicine name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Doses in mg',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Medicine type'),
                SizedBox(height: 16),
                SizedBox(
                  height: 120,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 4,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomMedCard('Pill', 'images/pill.png'),
                      CustomMedCard('Injection', 'images/syringe.png'),
                      CustomMedCard('Syrup', 'images/syrup.png'),
                      CustomMedCard('Inhaler', 'images/inhaler.png'),
                      CustomMedCard('Drop', 'images/drops.png'),
                      CustomMedCard('Lotion', 'images/lotion.png'),
                      CustomMedCard('Others', 'images/medicine.png'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text('After how many days to take this medicine?'),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Eg. enter 0 for everyday',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Starting date'),
                SizedBox(height: 16),
                TextFormField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? current = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now(),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Date',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.date_range_outlined,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _timesController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'How many times should be taken daily?',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _numberOfTimes = int.tryParse(value) ?? 1;
                    });
                  },
                ),
                SizedBox(height: 16),
                Column(
                  children: _buildTimePickers(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
