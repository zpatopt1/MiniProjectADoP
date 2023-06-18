import 'package:http/http.dart' as http;
import 'dart:convert';

class PositivePlayersByTimeAPI {
  Future<List<dynamic>> fetchPositivePlayers(String startDate, String endDate) async {
    final response = await http.get(Uri.parse('http://localhost:3000/positive-players/$startDate/$endDate'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch positive players');
    }
  }
}
