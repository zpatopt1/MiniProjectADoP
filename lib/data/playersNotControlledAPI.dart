import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/player.dart';

class PlayersNotControlledAPI {
  static Future<List<Player>> fetchPlayersNotControlled(int days) async {
    final url = 'http://localhost:3000//players-tested-days/:days';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return List<Player>.from(data.map((player) => Player.fromJson(player)));
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }
}
