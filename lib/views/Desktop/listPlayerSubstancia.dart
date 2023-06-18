import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PositivePlayersPage extends StatefulWidget {
  @override
  _PositivePlayersPageState createState() => _PositivePlayersPageState();
}

class _PositivePlayersPageState extends State<PositivePlayersPage> {
  List<dynamic> _positivePlayersList = [];

  Future<void> fetchPositivePlayers() async {
    final response = await http.get(Uri.parse('http://localhost:3000/positive-players'));

    if (response.statusCode == 200) {
      setState(() {
        _positivePlayersList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch positive players');
    }
  }

  @override
  void initState() {
    fetchPositivePlayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Players'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
    );
  }
}
