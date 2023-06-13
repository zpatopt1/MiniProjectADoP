import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mini_project/Models/player.dart';

class PlayerData {
  final String apiUrl = 'http://localhost:3000/players';

  Future<void> updateData(Player player) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${player.cc_player}'),
      body: json.encode({
        'id_clube': player.clubId,
        'nome': player.name,
        'ativo': player.isActive ? 1 : 0,
        'dt_nasc': player.dateOfBirth.toString(),
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Player updated successfully');
    } else {
      print('Failed to update player data');
    }
  }
}
