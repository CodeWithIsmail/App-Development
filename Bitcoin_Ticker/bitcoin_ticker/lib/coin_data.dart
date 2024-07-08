import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const apikey = 'D7601D2B-99A2-40C4-9E1E-D2979E65F394';
const mainurl = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData();

  Future<double> getConvert(String currency, String base) async {
    String url = '$mainurl/$base/$currency?apikey=$apikey';
    http.Response response = await http.get(Uri.parse(url));
    var decoded = jsonDecode(response.body);
    double rate = decoded['rate'];
    print(rate);
    return rate;
  }
}
