import 'package:http/http.dart' as http;

class PlayerDeleteData {
  static Future<void> deletePlayer(int playerId) async {
    final String apiUrl = 'http://localhost:3000/players';

    try {
      final response = await http.delete(
        Uri.parse('$apiUrl/$playerId'),
      );

      if (response.statusCode == 200) {
        print('Jogador removido com sucesso');
      } else {
        print('Erro ao remover jogador');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
  }
}
