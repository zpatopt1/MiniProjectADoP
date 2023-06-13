import 'package:flutter/material.dart';
import '../../data/dashboardAPI.dart';

class DashboardPage3 extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage3> {
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
    List<Map<String, dynamic>> topPlayersByTeam =
        (dashboardData['top10JogadoresPorEquipe'] as List<dynamic>?)
                ?.cast<Map<String, dynamic>>()
                .toList() ??
            [];

    return Scaffold(
                  appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Top 10 Jogadores com menos registos de controlo por equipa',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: topPlayersByTeam.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = topPlayersByTeam[index];
                          return ListTile(
                            title: Text(item['nome_equipa'] ?? ''),
                            subtitle: Text(
                                'Jogador: ${item['nome_atleta'] ?? ''}, Total de Controlos: ${item['num_testes'] ?? 0}'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
