import 'package:flutter/material.dart';
import '../../Models/player.dart';
import '../../data/editPlayerAPI.dart';

class EditPlayerPage extends StatefulWidget {
  @override
  _EditPlayerPageState createState() => _EditPlayerPageState();
}

class _EditPlayerPageState extends State<EditPlayerPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController clubController = TextEditingController();
  final TextEditingController activeController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();

  void updatePlayerData() {
    final playerId = int.tryParse(idController.text);
    final name = nameController.text;
    final clubId = int.tryParse(clubController.text);
    final active = activeController.text == '1';
    final birthdate = birthdateController.text;

    if (playerId == null || clubId == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid input. Please enter valid Player ID and Club ID.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    final player = Player(
      cc_player: playerId,
      name: name,
      dateOfBirth: DateTime.tryParse(birthdate) ?? DateTime.now(),
      isActive: active,
      clubId: clubId,
    );

    final playerData = PlayerData();

    playerData.updateData(player).then((_) {
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
    }).catchError((error) {
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
    });
  }

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
              onPressed: updatePlayerData,
            ),
          ],
        ),
      ),
    );
  }
}
