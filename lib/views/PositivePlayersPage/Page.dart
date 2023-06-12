import 'package:flutter/material.dart';

import '../../data/PositivePlayers.dart';


class PositivePlayersPage extends StatefulWidget {
  @override
  _PositivePlayersPageState createState() => _PositivePlayersPageState();
}

class _PositivePlayersPageState extends State<PositivePlayersPage> {
  List<dynamic> positivePlayers = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchPositivePlayers();
  }

  Future<void> fetchPositivePlayers() async {
    setState(() {
      isLoading = true;
    });

    ApiService apiService = ApiService();
    try {
      List<dynamic> players = await apiService.fetchPositivePlayers();
      setState(() {
        positivePlayers = players;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Players'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
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
