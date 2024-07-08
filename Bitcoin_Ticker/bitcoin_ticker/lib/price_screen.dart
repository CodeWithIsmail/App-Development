// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/CurrencyCard.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String bitSelected = "Select Unit";
  String rate1 = ' ? ';
  String rate2 = ' ? ';
  String rate3 = ' ? ';
  String currency = ' ';

  void updateUI(String value) async {
    double rt1 = await CoinData().getConvert(value, 'BTC');
    double rt2 = await CoinData().getConvert(value, 'ETH');
    double rt3 = await CoinData().getConvert(value, 'LTC');
    setState(() {
      bitSelected = value;
      rate1 = rt1.toStringAsFixed(3);
      rate2 = rt2.toStringAsFixed(3);
      rate3 = rt3.toStringAsFixed(3);
      currency = bitSelected;
    });
  }

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
      onChanged: (value) async {
        updateUI(value);
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
      onSelectedItemChanged: (value) async {
        updateUI(currenciesList[value]);
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
          CurrencyCard(rate1, currency, 'BTC'),
          CurrencyCard(rate2, currency, 'ETH'),
          CurrencyCard(rate3, currency, 'LTC'),
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

