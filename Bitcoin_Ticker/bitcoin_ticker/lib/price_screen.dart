// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String bitSelected = "Select Unit";

  DropdownButton AndroidDropDown() {
    List<DropdownMenuItem<String>> allCurrency = [];
    for (String cur in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          cur,
        ),
        value: cur,
      );
      allCurrency.add(newItem);
    }

    return DropdownButton(
      hint: Text(bitSelected),
      items: allCurrency,
      onChanged: (value) {
        setState(() {
          bitSelected = value!;
          print(bitSelected);
        });
      },
    );
  }

  CupertinoPicker IOSpicker() {
    List<Text> allCurrency = [];
    for (String cur in currenciesList) {
      var newItem = Text(
        cur,
      );
      allCurrency.add(newItem);
    }
    return CupertinoPicker(
      itemExtent: 35,
      onSelectedItemChanged: (value) {
        print(currenciesList[value]);
      },
      children: allCurrency,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? AndroidDropDown() : IOSpicker(),
          ),
        ],
      ),
    );
  }
}
