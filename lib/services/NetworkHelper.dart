import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  final String apiKey = '1e3c349cc25d35cea4a89cf86995cd6b';

  Future getData() async {
    var response = await http.get(url, headers: {
      'accept': 'application/json',
      'user-key': apiKey,
    });

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      print(response.statusCode);
    }
  }
}
