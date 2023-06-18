import 'package:flutter/material.dart';

import '../../data/Desktop/listPlayerSubstanciaAPI.dart.dart';

class PositivePlayersBySubstancePage extends StatefulWidget {
  @override
  _PositivePlayersBySubstancePageState createState() =>
      _PositivePlayersBySubstancePageState();
}

class _PositivePlayersBySubstancePageState
    extends State<PositivePlayersBySubstancePage> {
  List<dynamic> _positivePlayersList = [];

  @override
  void initState() {
    fetchPositivePlayers();
    super.initState();
  }

  Future<void> fetchPositivePlayers() async {
    try {
      PositivePlayersAPI api = PositivePlayersAPI();
      List<dynamic> players = await api.fetchPositivePlayers();

      setState(() {
        _positivePlayersList = players;
      });
    } catch (e) {
      throw Exception('Failed to fetch positive players');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Players'),
        backgroundColor: Colors.black,
      ),
      body: PositivePlayersListView(playersList: _positivePlayersList),
    );
  }
}

class PositivePlayersListView extends StatelessWidget {
  final List<dynamic> playersList;

  PositivePlayersListView({required this.playersList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: playersList.length,
        itemBuilder: (BuildContext context, int index) {
          return PositivePlayerTile(playerData: playersList[index]);
        },
      ),
    );
  }
}

class PositivePlayerTile extends StatelessWidget {
  final dynamic playerData;

  PositivePlayerTile({required this.playerData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(playerData['nome_jogador']),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Club: ${playerData['nome_clube']}'),
          Text('Team: ${playerData['nome_equipa']}'),
          Text('Sampling Date: ${playerData['data_colheita']}'),
          Text('Test Date: ${playerData['data_teste']}'),
          Text('Laboratory: ${playerData['laboratorio']}'),
          Text('Positive Substance: ${playerData['substancia_positiva']}'),
        ],
      ),
    );
  }
}
