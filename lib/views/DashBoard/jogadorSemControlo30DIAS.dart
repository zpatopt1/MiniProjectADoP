import 'package:flutter/material.dart';
import '../../data/dashboardAPI.dart';

class DashboardPage5 extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage5> {
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
                          'Jogadores sem controlo nos ultimos 30dias',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
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
