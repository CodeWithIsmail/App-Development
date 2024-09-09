import 'package:medication_reminder/ImportAll.dart';

class AddMed extends StatefulWidget {
  const AddMed({super.key});

  @override
  State<AddMed> createState() => _AddMedState();
}

class _AddMedState extends State<AddMed> {
  final TextEditingController MedicineName = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController MedicineType = TextEditingController();
  final TextEditingController DayGap = TextEditingController();
  final TextEditingController StartDay = TextEditingController();
  final TextEditingController DailyTimes = TextEditingController();

  int _numberOfTimes = 1;
  List<String> _selectedTimes = [];

  @override
  void initState() {
    super.initState();
    _updateSelectedTimes();
  }

  void _updateSelectedTimes() {
    setState(() {
      if (_numberOfTimes > 0) {
        _selectedTimes =
            List.generate(_numberOfTimes, (index) => "Enter Time ${index + 1}");
      } else {
        _selectedTimes = [];
      }
    });
  }

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
                setState(() {
                  _selectedTimes[i] = selectedTime.format(context);
                });
              }
            },
            decoration: InputDecoration(
              hintText:
                  _selectedTimes.isNotEmpty ? _selectedTimes[i] : 'Select Time',
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 30),
                TextFormField(
                  controller: MedicineName,
                  decoration: InputDecoration(
                    hintText: 'Medicine name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: quantity,
                  decoration: InputDecoration(
                    hintText: 'Doses in mg',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text('Medicine type', style: AddPageTextStyle),
                SizedBox(height: 15),
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
                SizedBox(height: 30),
                Text('After how many days to take this medicine?',
                    style: AddPageTextStyle),
                SizedBox(height: 16),
                TextFormField(
                  controller: DayGap,
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
                SizedBox(height: 30),
                Text('Starting date', style: AddPageTextStyle),
                SizedBox(height: 16),
                TextFormField(
                  controller: StartDay,
                  readOnly: true,
                  onTap: () async {
                    DateTime? current = await showDatePicker(
                      context: context,
                      lastDate: DateTime.now().add(Duration(days: 100)),
                      firstDate: DateTime.now(),
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
                SizedBox(height: 30),
                TextFormField(
                  controller: DailyTimes,
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
                    _numberOfTimes = int.tryParse(value) ?? 0;
                    _updateSelectedTimes();
                  },
                ),
                SizedBox(height: 16),
                Column(
                  children: _buildTimePickers(),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
