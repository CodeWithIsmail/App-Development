import '../ImportAll.dart';

class AddExpense extends StatefulWidget {
  FirestoreService firestoreService;
  String ExpenseDropDownText;
  String TransactionDropDownText;
  String amount;
  String date;
  String title;

  AddExpense(this.title, this.TransactionDropDownText, this.ExpenseDropDownText,
      this.amount, this.date, this.firestoreService);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController amountCon = TextEditingController();
  TextEditingController dateCon = TextEditingController();
  DateTime selected = DateTime.now();

  @override
  void initState() {
    if (widget.title == 'Edit') {
      dateCon.text = widget.date;
      String input = widget.amount;
      String amount = input.substring(0, input.indexOf(' '));
      amountCon.text = amount;
    } else {
      dateCon.text = DateFormat('dd-MMM-yy').format(DateTime.now());
    }
    super.initState();
  }

  var transaction_type = [
    'Expense',
    'Income',
  ];

  var expense_type = [
    'Food',
    'Shopping',
    'Education',
    'Transport',
    'Health',
    'Travel',
    'Home',
    'Others',
  ];
  var income_type = [
    'Salary',
    'Saving',
    'Others',
  ];

  // String ExpenseDropDown = ;
  // String TransactionDropDown = 'Expense';

  void updateDropDown() {
    if (widget.TransactionDropDownText == 'Income') {
      widget.ExpenseDropDownText = 'Salary';
      expense_type = [
        'Salary',
        'Saving',
        'Others',
      ];
    } else {
      widget.ExpenseDropDownText = 'Health';
      expense_type = [
        'Food',
        'Shopping',
        'Education',
        'Transport',
        'Health',
        'Travel',
        'Home',
        'Others',
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add Transaction',
                  style: addTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // width: MediaQuery.of(context).size.width * 0.8,
                  height: kToolbarHeight,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.list),
                      Text('Select transaction type'),
                      DropdownButton(
                          value: widget.TransactionDropDownText,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items:
                              transaction_type.map((String transaction_type) {
                            return DropdownMenuItem(
                              child: Text(transaction_type),
                              value: transaction_type,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              widget.TransactionDropDownText = newValue!;
                              updateDropDown();
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // width: MediaQuery.of(context).size.width * 0.8,
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.list),
                      Text('Select ${widget.TransactionDropDownText} type'),
                      DropdownButton(
                          value: widget.ExpenseDropDownText,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: expense_type.map((String expense_type) {
                            return DropdownMenuItem(
                              child: Text(expense_type),
                              value: expense_type,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              widget.ExpenseDropDownText = newValue!;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: amountCon,
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.bangladeshiTakaSign,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: dateCon,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  onTap: () async {
                    DateTime? current = await showDatePicker(
                      context: context,
                      initialDate: selected,
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now(),
                    );

                    if (current != null) {
                      selected = current;
                      dateCon.text = DateFormat('dd-MMM-yy').format(current);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Date',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.clock,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    gradient: DashboardGradient,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      String type = widget.TransactionDropDownText;
                      String category = widget.ExpenseDropDownText;
                      int amount = int.parse(amountCon.text.toString());
                      String date = dateCon.text;
                      print(type);
                      print(category);
                      print(amount);
                      print(date);

                      widget.firestoreService
                          .addRecord(type, category, amount, date);

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
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
