import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getDataFromNet() async {
    http.Response response = await http.get(Uri.parse(url));

    print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
      var Ddata = jsonDecode(data);
      return Ddata;
    } else {
      print(response.statusCode);
    }
  }
}
