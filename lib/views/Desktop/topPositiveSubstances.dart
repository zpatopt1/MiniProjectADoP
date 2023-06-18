import 'package:flutter/material.dart';

import '../../data/Desktop/TopPositiveSubstanceAPI.dart';

class TopPositiveSubstancesPage extends StatefulWidget {
  @override
  _TopPositiveSubstancesPageState createState() =>
      _TopPositiveSubstancesPageState();
}

class _TopPositiveSubstancesPageState extends State<TopPositiveSubstancesPage> {
  List<dynamic> _topSubstancesList = [];

  TopPositiveSubstancesAPI _api = TopPositiveSubstancesAPI();

  @override
  void initState() {
    fetchTopPositiveSubstances();
    super.initState();
  }

  Future<void> fetchTopPositiveSubstances() async {
    try {
      List<dynamic> substances = await _api.fetchTopPositiveSubstances();

      setState(() {
        _topSubstancesList = substances;
      });
    } catch (e) {
      throw Exception('Failed to fetch top positive substances');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Positive Substances'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _topSubstancesList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_topSubstancesList[index]['nome_substancia']),
              subtitle: Text(
                  'Positive Tests: ${_topSubstancesList[index]['quantidade_positivos']}'),
            );
          },
        ),
      ),
    );
  }
}
