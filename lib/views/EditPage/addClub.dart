import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/Models/club.dart';

import '../../data/EditClub/addClubAPI.dart';

class AddClubePage extends StatefulWidget {
  @override
  _AddClubePageState createState() => _AddClubePageState();
}

class _AddClubePageState extends State<AddClubePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idEquipaController = TextEditingController();

  void addClube() {
    final Map<String, dynamic> clubData = {
      'id_equipa': int.parse(idEquipaController.text),
      'nome': nomeController.text,
    };

    ClubAddData.addClube(clubData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Clube'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: idEquipaController,
              decoration: InputDecoration(
                labelText: 'ID da Equipa',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addClube,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text('Adicionar Clube'),
            ),
          ],
        ),
      ),
    );
  }
}
