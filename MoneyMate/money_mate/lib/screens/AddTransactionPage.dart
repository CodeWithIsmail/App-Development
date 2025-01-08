import '../ImportAll.dart';

class HandleTransaction extends StatefulWidget {
  String expenseDropDownText;
  String transactionDropDownText;
  String amount;
  String date;
  String title;

  HandleTransaction(this.title, this.transactionDropDownText,
      this.expenseDropDownText, this.amount, this.date,
      {super.key});

  @override
  State<HandleTransaction> createState() => _HandleTransactionState();
}

class _HandleTransactionState extends State<HandleTransaction> {
  TextEditingController amountCon = TextEditingController();
  TextEditingController dateCon = TextEditingController();
  DateTime selected = DateTime.now();
  late FirestoreService firestoreService;

  @override
  void initState() {
    if (widget.title == 'Edit') {
      dateCon.text = widget.date;
      String amount = widget.amount.split(' ')[0];
      amountCon.text = amount;
    } else {
      dateCon.text = DateFormat('dd-MMM-yy').format(DateTime.now());
    }
    firestoreService = FirestoreService(getCurrentUser() ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addTransactionProvider = Provider.of<AddTransactionProvider>(context);

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
                Text('${widget.title} Transaction', style: addTextStyle),
                const SizedBox(height: 30),
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
                        value: addTransactionProvider.transactionType,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: ['Expense', 'Income'].map((String type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          addTransactionProvider
                              .updateTransactionType(newValue!);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
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
                      Text(
                          'Select ${addTransactionProvider.transactionType} type'),
                      DropdownButton(
                        value: addTransactionProvider.expenseType,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: addTransactionProvider.expenseOptions
                            .map((String type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          addTransactionProvider.updateExpenseType(newValue!);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                CustomAmountInput(amountCon: amountCon),
                const SizedBox(height: 16),
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
                const SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    gradient: DashboardGradient,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      String type = addTransactionProvider.transactionType;
                      String category = addTransactionProvider.expenseType;
                      int amount = int.parse(amountCon.text);
                      String date = dateCon.text;

                      DateTime finalDateTime = DatetimeHandle(date);
                      firestoreService.addRecord(
                          type, category, amount, date, finalDateTime);

                      Navigator.pop(context);
                    },
                    child: const CustomSaveButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
