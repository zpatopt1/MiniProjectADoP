import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard {
  static Future<Map<String, dynamic>> fetchDashboard() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/dashboard'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Erro ao buscar os dados da dashboard');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
    return {};
  }
}
