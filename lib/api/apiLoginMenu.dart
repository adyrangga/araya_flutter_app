import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Object apiLoginMenu() async {
  var url = 'https://otan-e4c29.firebaseio.com/araya-flutter-app.json?print=pretty';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // var itemCount = jsonResponse['totalItems'];
    print('jsonResponse http: $jsonResponse.');
    return jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
