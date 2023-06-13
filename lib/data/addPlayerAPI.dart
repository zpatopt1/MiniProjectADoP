import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerAddData {
  static Future<void> addPlayer(Map<String, dynamic> playerData) async {
    final String apiUrl = 'http://localhost:3000/players';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(playerData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
      } else {
        print('Erro ao adicionar jogador');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
  }
}
