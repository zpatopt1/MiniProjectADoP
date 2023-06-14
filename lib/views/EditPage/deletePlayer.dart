import 'package:flutter/material.dart';

import '../../data/deletePlayerAPI.dart';

class PlayerDeletePage extends StatefulWidget {
  @override
  _PlayerDeletePageState createState() => _PlayerDeletePageState();
}

class _PlayerDeletePageState extends State<PlayerDeletePage> {
  final TextEditingController _playerIdController = TextEditingController();

  // chamar o método para excluir o jogador com o ID.
  void deletePlayer() {
    final int playerId = int.parse(_playerIdController.text);
    PlayerDeleteData.deletePlayer(playerId);
  }

  void showSuccessMessage(String message) {
    showDialog(
      context: context,
      // alertar utilizador
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
      // exibir appbar
      appBar: AppBar(
        title: Text('Remover Jogador'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _playerIdController,
              decoration:
                  InputDecoration(labelText: 'ID do Jogador'), // label do campo
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deletePlayer, // submeter eliminação
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black), // inserir cor do botão
              child: Text('Remover Jogador'),
            ),
          ],
        ),
      ),
    );
  }
}
