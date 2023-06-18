import 'package:flutter/material.dart';
import '../../data/Desktop/timePositivePlayersAPI.dart';

class TimePositivePlayersPage extends StatefulWidget {
  @override
  _PositivePlayersPageState createState() => _PositivePlayersPageState();
}

class _PositivePlayersPageState extends State<TimePositivePlayersPage> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  List<dynamic> _positivePlayersList = [];

  PositivePlayersByTimeAPI _api = PositivePlayersByTimeAPI();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> fetchPositivePlayers(String startDate, String endDate) async {
    try {
      List<dynamic> players =
          await _api.fetchPositivePlayers(startDate, endDate);

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'Start Date (YYYY-MM-DD)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'End Date (YYYY-MM-DD)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String startDate = _startDateController.text;
                String endDate = _endDateController.text;
                fetchPositivePlayers(startDate, endDate);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Set button background color to black
              ),
              child: Text('Search',),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _positivePlayersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return PositivePlayerTile(
                    playerData: _positivePlayersList[index],
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
