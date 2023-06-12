import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardPage2 extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage2> {
  Map<String, dynamic> dashboardData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/dashboard'));
      if (response.statusCode == 200) {
        setState(() {
          dashboardData = json.decode(response.body) as Map<String, dynamic>;
        });
      } else {
        print('Erro ao buscar os dados da dashboard');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> topPlayersByChampionship = (dashboardData['top5JogadoresPorCompeticao'] as List<dynamic>?)?.cast<Map<String, dynamic>>().toList() ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Top 5 Jogadores por Competição',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: topPlayersByChampionship.length,
              itemBuilder: (BuildContext context, int index) {
                final item = topPlayersByChampionship[index];
                return ListTile(
                  title: Text(item['nome_campeonato'] ?? ''),
                  subtitle: Text('Jogador: ${item['nome_atleta'] ?? ''}, Total de Registros: ${item['total_registros'] ?? 0}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
