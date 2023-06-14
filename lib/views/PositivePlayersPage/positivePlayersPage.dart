import 'package:flutter/material.dart';
import '../../data/positivePlayersAPI.dart';

class PositivePlayers extends StatefulWidget {
  @override
  _PositivePlayersState createState() => _PositivePlayersState();
}

class _PositivePlayersState extends State<PositivePlayers> {
  List<dynamic> positivePlayers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await PositivePlayersAPI.fetchPositivePlayers();
      setState(() {
        positivePlayers = data;
      });
    } catch (error) {
      print('Error fetching positive players: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Players'),
      ),
      body: ListView.builder(
        itemCount: positivePlayers.length,
        itemBuilder: (context, index) {
          final player = positivePlayers[index];
          return ListTile(
            title: Text(player['nome_jogador']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Clube: ${player['nome_clube']}'),
                Text('Equipa: ${player['nome_equipa']}'),
                Text('Data da colheita: ${player['data_colheita']}'),
                Text('Data do teste: ${player['data_teste']}'),
                Text('Laboratório de testagem: ${player['laboratorio']}'),
                Text('Substância: ${player['substancia_positiva']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
