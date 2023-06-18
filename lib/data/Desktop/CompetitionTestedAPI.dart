import 'package:http/http.dart' as http;
import 'dart:convert';

class CompetitionTestedPlayersApi {
  static Future<List<dynamic>> fetchCompetitionTestedPlayers() async {
    final response = await http.get(Uri.parse('http://localhost:3000/competition-tested-players'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch competition tested players');
    }
  }
}
