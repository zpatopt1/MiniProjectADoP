import 'package:flutter/material.dart';

import '../../data/addPlayerAPI.dart';

class PlayerAddPage extends StatefulWidget {
  @override
  _PlayerAddPageState createState() => _PlayerAddPageState();
}

class _PlayerAddPageState extends State<PlayerAddPage> {
  final TextEditingController _clubIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _activeController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  void addPlayer() {
    final Map<String, dynamic> playerData = {
      'id_clube': int.parse(_clubIdController.text),
      'nome': _nameController.text,
      'ativo': _activeController.text,
      'dt_nasc': _birthdateController.text,
    };

    PlayerAddData.addPlayer(playerData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text('Adicionar Jogador'),
            ),
          ],
        ),
      ),
    );
  }
}
