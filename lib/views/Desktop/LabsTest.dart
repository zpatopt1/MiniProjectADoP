import 'package:flutter/material.dart';

import '../../data/Desktop/labsTestAPI.dart';

class LabsTestedPage extends StatefulWidget {
  @override
  _LabsTestedPageState createState() => _LabsTestedPageState();
}

class _LabsTestedPageState extends State<LabsTestedPage> {
  List<dynamic> _labsTestedList = [];

  LabsTestedAPI _api = LabsTestedAPI();

  @override
  void initState() {
    fetchLabsTested();
    super.initState();
  }

  Future<void> fetchLabsTested() async {
    try {
      List<dynamic> labs = await _api.fetchLabsTested();

      setState(() {
        _labsTestedList = labs;
      });
    } catch (e) {
      throw Exception('Failed to fetch labs tested');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labs Tested'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _labsTestedList.length,
          itemBuilder: (BuildContext context, int index) {
            return LabsTestedTile(labData: _labsTestedList[index]);
          },
        ),
      ),
    );
  }
}

class LabsTestedTile extends StatelessWidget {
  final dynamic labData;

  LabsTestedTile({required this.labData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(labData['nome_laboratorio']),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tested Tests: ${labData['quantidade_testes']}'),
          Text('Positive Tests: ${labData['quantidade_positivos']}'),
        ],
      ),
    );
  }
}
