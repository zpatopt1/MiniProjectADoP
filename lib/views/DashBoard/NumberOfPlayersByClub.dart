import 'package:flutter/material.dart';
import '../../data/Dashboard/dashboardAPI.dart';

class NumberOfPlayersByClub extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<NumberOfPlayersByClub> {
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
    return Scaffold(
      // exibir appBar
      appBar: AppBar(
        title: Text('Nº de Jogadores por Clube'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: dashboardData['jogadoresPorClube']?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final item = dashboardData['jogadoresPorClube'][index];
                    return ListTile(
                      title: Text(item['nome']),
                      subtitle: Text(
                          'Quantidade de jogadores: ${item['quantidade_jogadores']}'),
                    );
                  },
                ),
              ),
            ),
            // avisar o utilizador caso não seja o jogador seja encontrado
            if (dashboardData.containsKey('jogadoresPorClube') &&
                dashboardData['jogadoresPorClube'].isEmpty)
              Text('Nenhum jogador encontrado.'),
            if (!dashboardData.containsKey('jogadoresPorClube'))
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
