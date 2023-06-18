import 'package:http/http.dart' as http;
import 'dart:convert';

class ClubAddData {
  static Future<void> addPlayer(Map<String, dynamic> ClubData) async {
    final String apiUrl = 'http://localhost:3000/clube';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(ClubData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
      } else {
        print('Erro ao adicionar clube');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
  }
}