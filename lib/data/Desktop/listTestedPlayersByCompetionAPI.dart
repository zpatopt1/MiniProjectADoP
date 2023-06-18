import 'package:http/http.dart' as http;
import 'dart:convert';

class TestedPlayersByCompetitionAPI {
  Future<List<dynamic>> fetchTestedPlayersByCompetititon(String competition) async {
    final response = await http.get(Uri.parse('http://localhost:3000/tested-players/$competition'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch tested players');
    }
  }
}
