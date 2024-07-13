// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'all.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple.shade400,
                      ),
                      child: Icon(
                        CupertinoIcons.person_fill,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome!',
                          style: welcomeTextStyle,
                        ),
                        Text(
                          'Ismail Hossain',
                          style: NameTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  CupertinoIcons.settings,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ],
                  transform: GradientRotation(pi / 4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Net Balance',
                      style: NetBalTextStyle,
                    ),
                    Text(
                      '13000',
                      style: BalTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              child: Icon(
                                size: 20,
                                CupertinoIcons.up_arrow,
                                color: Colors.lightGreenAccent,
                              ),
                              backgroundColor: Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  style: TitleTextStyle,
                                ),
                                Text(
                                  '2000',
                                  style: ValueTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              child: Icon(
                                size: 20,
                                CupertinoIcons.down_arrow,
                                color: Colors.red.shade900,
                              ),
                              backgroundColor: Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expenses',
                                  style: TitleTextStyle,
                                ),
                                Text(
                                  '1000',
                                  style: ValueTextStyle,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expenses',
                  style: ExpensesTextStyle,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: ViewAllTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: TransactionData.length,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(5, 5),
                            blurRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: TransactionData[i]['color'],
                                    shape: BoxShape.circle,
                                  ),
                                  width: 60,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: TransactionData[i]['icon'],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TransactionData[i]['name'],
                                  style: ExpenseTitleTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  TransactionData[i]['amount'],
                                  style: ExpenseValTextStyle,
                                ),
                                Text(TransactionData[i]['date'],
                                    style: ExpenseDayTextStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
