import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RandomPlayerControlNextWeekAPI {
  static Future<List<dynamic>> fetchRandomPlayersControlNextWeek() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/random-players-control-next-week'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Erro ao buscar os jogadores aleatórios');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
    return [];
  }
}