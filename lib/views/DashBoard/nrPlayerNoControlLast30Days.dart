import 'package:flutter/material.dart';
import '../../data/Dashboard/dashboardAPI.dart';

class NumberOfPlayersWithoutControlOnLast30Days extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<NumberOfPlayersWithoutControlOnLast30Days> {
  Map<String, dynamic> dashboardData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await Dashboard.fetchDashboard();
    setState(() {
      dashboardData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // exibir AppBar
        backgroundColor: Colors.black,
        title: Text('Jogadores Não Controlados'),
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
                          // mostrar titulo
                          'Nº de Jogadores sem controlo nos últimos 30 dias',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // chamar listview
                      ListView.builder(
                        shrinkWrap: true,
                        // buscar dados
                        itemCount: dashboardData[
                                    'jogadoresSemControloUltimos30DiasPorClube']
                                ?.length ??
                            0,
                        itemBuilder: (BuildContext context, int index) {
                          final item = dashboardData[
                                  'jogadoresSemControloUltimos30DiasPorClube']
                              [index];
                          return ListTile(
                            title: Text(
                                'Quantidade de jogadores sem controlo: ${item['num_jogadores_sem_controlo']}'),
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
