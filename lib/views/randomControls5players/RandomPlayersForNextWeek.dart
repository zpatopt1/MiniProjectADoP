import 'package:flutter/material.dart';
import '../../data/5randomPlayerAPI.dart';

class RandomPlayerNextWeek extends StatefulWidget {
  @override
  _RandomPlayerNextWeekState createState() => _RandomPlayerNextWeekState();
}

class _RandomPlayerNextWeekState extends State<RandomPlayerNextWeek> {
  List<dynamic> randomPlayers = [];

  @override
  void initState() {
    super.initState();
    fetchRandomPlayers();
  }

  void fetchRandomPlayers() async {
    try {
      final data = await RandomPlayerControlNextWeekAPI.fetchRandomPlayersControlNextWeek();
      setState(() {
        randomPlayers = data;
      });
    } catch (error) {
      print('Error fetching random players: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sortear Jogadores'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: randomPlayers.length,
        itemBuilder: (context, index) {
          final player = randomPlayers[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(player['nome']),
              subtitle: Text('CC Atleta: ${player['CC_atleta']}'),
            ),
          );
        },
      ),
    );
  }
}
