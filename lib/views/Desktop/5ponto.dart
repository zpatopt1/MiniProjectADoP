import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LabsTestedPage extends StatefulWidget {
  @override
  _LabsTestedPageState createState() => _LabsTestedPageState();
}

class _LabsTestedPageState extends State<LabsTestedPage> {
  List<dynamic> _labsTestedList = [];

  Future<void> fetchLabsTested() async {
    final response = await http.get(Uri.parse('http://localhost:3000/labs-tested'));

    if (response.statusCode == 200) {
      setState(() {
        _labsTestedList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch labs tested');
    }
  }

  @override
  void initState() {
    fetchLabsTested();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labs Tested'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _labsTestedList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_labsTestedList[index]['nome_laboratorio']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tested Tests: ${_labsTestedList[index]['quantidade_testes']}'),
                  Text('Positive Tests: ${_labsTestedList[index]['quantidade_positivos']}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
