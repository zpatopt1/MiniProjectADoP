import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopPositiveSubstancesPage extends StatefulWidget {
  @override
  _TopPositiveSubstancesPageState createState() => _TopPositiveSubstancesPageState();
}

class _TopPositiveSubstancesPageState extends State<TopPositiveSubstancesPage> {
  List<dynamic> _topSubstancesList = [];

  Future<void> fetchTopPositiveSubstances() async {
    final response = await http.get(Uri.parse('http://localhost:3000/top-positive-substances'));

    if (response.statusCode == 200) {
      setState(() {
        _topSubstancesList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch top positive substances');
    }
  }

  @override
  void initState() {
    fetchTopPositiveSubstances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Positive Substances'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _topSubstancesList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_topSubstancesList[index]['nome_substancia']),
              subtitle: Text('Positive Tests: ${_topSubstancesList[index]['quantidade_positivos']}'),
            );
          },
        ),
      ),
    );
  }
}
