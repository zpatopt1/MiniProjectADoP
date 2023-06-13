import 'package:flutter/material.dart';
import '../../data/dashboardAPI.dart';



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
    final data = await Dashboard.fetchDashboardData();
    setState(() {
      dashboardData = data;
    });
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
