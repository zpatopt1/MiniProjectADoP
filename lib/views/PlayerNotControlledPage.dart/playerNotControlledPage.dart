import 'package:flutter/material.dart';
import '../../Models/player.dart';
import '../../data/playerNotControlledAPI.dart';

class PlayerNotControlledPage extends StatefulWidget {
  @override
  _PlayerNotControlledPageState createState() =>
      _PlayerNotControlledPageState();
}

class _PlayerNotControlledPageState extends State<PlayerNotControlledPage> {
  TextEditingController daysController = TextEditingController();
  int days = 0;
  List<Player> players = [];
  bool isLoading = false;

  Future<void> fetchPlayersNotControlled() async {
    setState(() {
      isLoading = true;
      players = [];
    });

    days = int.parse(daysController.text);

    try {
      players = await PlayerService.getPlayersNotControlled(days);
    } catch (error) {
      print('Error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogadores Não Controlados'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: daysController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número de dias',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: fetchPlayersNotControlled,
              child: Text('Buscar'),
            ),
            SizedBox(height: 16.0),
            if (isLoading)
              CircularProgressIndicator()
            else if (players.isEmpty)
              Text('Nenhum jogador encontrado.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          player.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('CC: ${player.cc_player}'),
                        trailing: Text('Clube: ${player.clubId}'),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
