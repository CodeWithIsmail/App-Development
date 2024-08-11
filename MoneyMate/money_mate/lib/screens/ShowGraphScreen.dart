import 'package:flutter/material.dart';

import '../ImportAll.dart';

class Showgraph extends StatefulWidget {
  FirestoreService firestoreService;

  Showgraph(this.firestoreService);

  @override
  State<Showgraph> createState() => _ShowgraphState();
}

class _ShowgraphState extends State<Showgraph> {
  late DateTime endDate;
  late DateTime startDate;
  DateFormat dateFormat = DateFormat('dd MMM yy');
  String stDate = "";
  String enDate = "";

  @override
  void initState() {
    endDate = DateTime.now();
    startDate = endDate.subtract(Duration(days: 14));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    stDate = dateFormat.format(startDate);
    enDate = dateFormat.format(endDate);
    print(enDate);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date - Expense Bar Chart',
                style: TransactionTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        endDate = endDate.subtract(Duration(days: 15));
                        startDate = startDate.subtract(Duration(days: 15));
                      });
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                    ),
                  ),
                  Text('$stDate - $enDate'),
                  IconButton(
                    onPressed: () {
                        DateTime temp = DateTime.now();
                        String newTemp = dateFormat.format(temp);
                        if (newTemp != enDate) {
                          setState(() {
                            endDate = endDate.add(Duration(days: 15));
                            startDate = startDate.add(Duration(days: 15));
                          });
                        }

                      // print(stDate);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: MyChart(widget.firestoreService, endDate),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Category - Expense Bar Chart',
                style: TransactionTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: MyChart2(widget.firestoreService),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
