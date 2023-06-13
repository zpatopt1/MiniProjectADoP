import 'package:http/http.dart' as http;
import 'dart:convert';

class PositivePlayers {
  static Future<List<dynamic>> fetchDashboardData() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/positive-players'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Erro ao buscar os dados da dashboard');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
    return []; // Retorna uma lista vazia em caso de erro
  }
}
