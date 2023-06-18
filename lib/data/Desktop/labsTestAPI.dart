import 'package:http/http.dart' as http;
import 'dart:convert';

class LabsTestedAPI {
  Future<List<dynamic>> fetchLabsTested() async {
    final response = await http.get(Uri.parse('http://localhost:3000/labs-tested'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch labs tested');
    }
  }
}
