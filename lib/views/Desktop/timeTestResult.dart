import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TimePositivePlayersPage extends StatefulWidget {
  @override
  _PositivePlayersPageState createState() => _PositivePlayersPageState();
}

class _PositivePlayersPageState extends State<TimePositivePlayersPage> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  List<dynamic> _positivePlayersList = [];

  Future<void> fetchPositivePlayers(String startDate, String endDate) async {
    final response = await http.get(Uri.parse('http://localhost:3000/positive-players/$startDate/$endDate'));

    if (response.statusCode == 200) {
      setState(() {
        _positivePlayersList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch positive players');
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Players'),
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
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _positivePlayersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_positivePlayersList[index]['nome_jogador']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Club: ${_positivePlayersList[index]['nome_clube']}'),
                        Text('Team: ${_positivePlayersList[index]['nome_equipa']}'),
                        Text('Sampling Date: ${_positivePlayersList[index]['data_colheita']}'),
                        Text('Test Date: ${_positivePlayersList[index]['data_teste']}'),
                        Text('Laboratory: ${_positivePlayersList[index]['laboratorio']}'),
                        Text('Positive Substance: ${_positivePlayersList[index]['substancia_positiva']}'),
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
