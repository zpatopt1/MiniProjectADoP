import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlayerDeletePage extends StatefulWidget {
  @override
  _PlayerDeletePageState createState() => _PlayerDeletePageState();
}

class _PlayerDeletePageState extends State<PlayerDeletePage> {
  final TextEditingController _playerIdController = TextEditingController();

  void deletePlayer() async {
    final String apiUrl = 'http://localhost:3000/players';
    final int playerId = int.parse(_playerIdController.text);

    try {
      final response = await http.delete(
        Uri.parse('$apiUrl/$playerId'),
      );

      if (response.statusCode == 200) {
        showSuccessMessage('Jogador removido com sucesso');
      } else {
        print('Erro ao remover jogador');
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
        title: Text('Remover Jogador'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _playerIdController,
              decoration: InputDecoration(labelText: 'ID do Jogador'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deletePlayer,
              child: Text('Remover Jogador'),
            ),
          ],
        ),
      ),
    );
  }
}
