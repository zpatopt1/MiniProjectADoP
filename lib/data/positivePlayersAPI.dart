import 'package:http/http.dart' as http;
import 'dart:convert';

class PositivePlayersAPI {
  static Future<List<dynamic>> fetchPositivePlayers() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/positive-players'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Error fetching positive players: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching positive players: $error');
    }
    return []; // Retorna uma lista vazia em caso de erro
  }
}
