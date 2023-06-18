import 'package:http/http.dart' as http;
import 'dart:convert';

class TopPositiveSubstancesAPI {
  Future<List<dynamic>> fetchTopPositiveSubstances() async {
    final response = await http.get(Uri.parse('http://localhost:3000/top-positive-substances'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch top positive substances');
    }
  }
}
