import 'package:flutter/material.dart';

import '../../data/EditPlayers/addPlayerAPI.dart';

class ClubAddPage extends StatefulWidget {
  @override
  _PlayerAddPageState createState() => _PlayerAddPageState();
}

class _PlayerAddPageState extends State<ClubAddPage> {
  final TextEditingController _equipaIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
 

  // chamar o método para adicionar o jogador.
  void addPlayer() {
    final Map<String, dynamic> ClubData = {
      'id_equipa': int.parse(_equipaIdController.text),
      'nome': _nameController.text,

    };

    PlayerAddData.addPlayer(ClubData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // exibir AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Adicionar Jogador'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // preencher campos
            TextField(
              controller: _equipaIdController,
              decoration: InputDecoration(labelText: 'ID da equipa'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome da equipa'),
            ),
            SizedBox(height: 20),
            //
            ElevatedButton(
              onPressed: addPlayer, // submeter adição de jogador
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text('Adicionar Jogador'),
            ),
          ],
        ),
      ),
    );
  }
}
