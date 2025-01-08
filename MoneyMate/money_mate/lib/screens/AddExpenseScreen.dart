import '../ImportAll.dart';

class AddExpense extends StatefulWidget {
  String ExpenseDropDownText;
  String TransactionDropDownText;
  String amount;
  String date;
  String title;

  AddExpense(this.title, this.TransactionDropDownText, this.ExpenseDropDownText,
      this.amount, this.date);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController amountCon = TextEditingController();
  TextEditingController dateCon = TextEditingController();
  DateTime selected = DateTime.now();
  late FirestoreService firestoreService;

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
    firestoreService = FirestoreService(getCurrentUser() ?? "");
    super.initState();
  }

  var transactionType = [
    'Expense',
    'Income',
  ];
  var expenseType = [
    'Food',
    'Shopping',
    'Education',
    'Transport',
    'Health',
    'Travel',
    'Home',
    'Others',
  ];
  var incomeType = [
    'Salary',
    'Saving',
    'Others',
  ];

  void updateDropDown() {
    if (widget.TransactionDropDownText == 'Income') {
      widget.ExpenseDropDownText = 'Salary';
      expenseType = [
        'Salary',
        'Saving',
        'Others',
      ];
    } else {
      widget.ExpenseDropDownText = 'Health';
      expenseType = [
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
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.title} Transaction',
                  style: addTextStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.list),
                      const Text('Select transaction type'),
                      DropdownButton(
                          value: widget.TransactionDropDownText,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: transactionType.map((String transactionType) {
                            return DropdownMenuItem(
                              value: transactionType,
                              child: Text(transactionType),
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
                const SizedBox(
                  height: 18,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.list),
                      Text('Select ${widget.TransactionDropDownText} type'),
                      DropdownButton(
                          value: widget.ExpenseDropDownText,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: expenseType.map((String expenseType) {
                            return DropdownMenuItem(
                              value: expenseType,
                              child: Text(expenseType),
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
                const SizedBox(
                  height: 16,
                ),
                CustomAmountInput(amountCon: amountCon),
                const SizedBox(
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
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now(),
                    );

                    if (current != null) {
                      selected = current;
                      dateCon.text = DateFormat('dd-MMM-yy').format(current);
                    }
                  },
                  decoration: dateFieldDecoration,
                ),
                const SizedBox(
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

                      DateTime finalDateTime = DatetimeHandle(date);
                      firestoreService.addRecord(
                          type, category, amount, date, finalDateTime);

                      Navigator.pop(context);
                    },
                    child: const CustomSaveButton(),
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
