import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerAddPage extends StatefulWidget {
  @override
  _PlayerAddPageState createState() => _PlayerAddPageState();
}

class _PlayerAddPageState extends State<PlayerAddPage> {
  final TextEditingController _clubIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _activeController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  void addPlayer() async {
    final String apiUrl = 'http://localhost:3000/players';
    final Map<String, dynamic> playerData = {
      'id_clube': int.parse(_clubIdController.text),
      'nome': _nameController.text,
      'ativo': _activeController.text,
      'dt_nasc': _birthdateController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(playerData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        showSuccessMessage(responseData['message']);
      } else {
        print('Erro ao adicionar jogador');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
  }

  void showSuccessMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sucesso'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Jogador'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _clubIdController,
              decoration: InputDecoration(labelText: 'ID do Clube'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Jogador'),
            ),
            TextField(
              controller: _activeController,
              decoration: InputDecoration(labelText: 'Ativo'),
            ),
            TextField(
              controller: _birthdateController,
              decoration: InputDecoration(labelText: 'Data de Nascimento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addPlayer,
              child: Text('Adicionar Jogador'),
            ),
          ],
        ),
      ),
    );
  }
}
