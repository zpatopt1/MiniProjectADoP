import 'package:flutter/material.dart';
import '../../data/Dashboard/dashboardAPI.dart';

class NumberOfPlayersWithControlOnLast30Days extends StatefulWidget {
  @override
  _DashboardPage4State createState() => _DashboardPage4State();
}

class _DashboardPage4State extends State<NumberOfPlayersWithControlOnLast30Days> {
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
        title: Text('Jogadores Testados'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // mostrar titulo
                      'Número de jogadores que efetuaram controlo antidoping nos últimos 30 dias, por clube',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        // Definir o número de itens da lista com base na contagem
                        itemCount: dashboardData[
                                    'jogadoresControloUltimos30DiasPorClube']
                                ?.length ??
                            0,
                        itemBuilder: (BuildContext context, int index) {
                          final item = dashboardData[
                              'jogadoresControloUltimos30DiasPorClube'][index];
                          return Card(
                            child: ListTile(
                              //mostrar dados
                              title: Text(item['nome_clube']),
                              subtitle: Text(
                                  'Quantidade de jogadores: ${item['num_jogadores']}'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
