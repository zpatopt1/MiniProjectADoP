import 'package:flutter/material.dart';

import '../../data/Desktop/listTestedPlayersByCompetionAPI.dart';

class TestedPlayersByCompetitionPage extends StatefulWidget {
  @override
  TestedPlayersByCompetitionState createState() =>
      TestedPlayersByCompetitionState();
}

class TestedPlayersByCompetitionState
    extends State<TestedPlayersByCompetitionPage> {
  TextEditingController _competitionController = TextEditingController();
  List<dynamic> _playersList = [];
  TestedPlayersByCompetitionAPI _playersData = TestedPlayersByCompetitionAPI();

  @override
  void dispose() {
    _competitionController.dispose();
    super.dispose();
  }

  Future<void> fetchTestedPlayers(String competition) async {
    List<dynamic> playersList =
        await _playersData.fetchTestedPlayersByCompetititon(competition);
    setState(() {
      _playersList = playersList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tested Players'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _competitionController,
              decoration: InputDecoration(
                labelText: 'Campionship',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String competition = _competitionController.text;
                fetchTestedPlayers(competition);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black, // Set button background color to black
              ),
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _playersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_playersList[index]['nome_jogador']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Clinic: ${_playersList[index]['nome_clinica']}'),
                        Text(
                            'Professional: ${_playersList[index]['nome_profissional']}'),
                      ],
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
