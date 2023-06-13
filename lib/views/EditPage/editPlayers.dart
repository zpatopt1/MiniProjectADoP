import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditPlayerPage extends StatefulWidget {
  @override
  _EditPlayerPageState createState() => _EditPlayerPageState();
}

class _EditPlayerPageState extends State<EditPlayerPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController clubController = TextEditingController();
  TextEditingController activeController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Player'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Player ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: clubController,
              decoration: InputDecoration(labelText: 'Club ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: activeController,
              decoration: InputDecoration(labelText: 'Active (0 or 1)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: birthdateController,
              decoration: InputDecoration(labelText: 'Birthdate (YYYY-MM-DD)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () => updatePlayerData(context),
            ),
          ],
        ),
      ),
    );
  }

  void updatePlayerData(BuildContext context) async {
    final playerId = int.parse(idController.text);
    final name = nameController.text;
    final clubId = int.parse(clubController.text);
    final active = int.parse(activeController.text) == 1 ? 1 : 0;
    final birthdate = birthdateController.text;

    final response = await http.put(
      Uri.parse('http://localhost:3000/players'),
      body: json.encode({
        'cc_atleta': playerId,
        'id_clube': clubId,
        'nome': name,
        'ativo': active,
        'dt_nasc': birthdate,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Player updated successfully'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to update player data'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
}
