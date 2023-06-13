import 'package:flutter/material.dart';
import 'package:mini_project/views/DashBoard/jogadorSemControlo30DIAS.dart';
import 'package:mini_project/views/DashBoard/numerosDeJogadoresQueFizeramAntiDoping.dart';
import 'package:mini_project/views/DashBoard/quantidadeJogadoresPorClube.dart';
import 'package:mini_project/views/DashBoard/top10_menos_controlos_por_equIpa.dart';
import 'package:mini_project/views/DashBoard/top5_player_campship.dart';
import 'package:flutter/material.dart';

class DashboardMobile extends StatefulWidget {
  @override
  _DashboardMobileState createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  List<Map<String, dynamic>> dashboardOptions = [
    {
      'title': 'Jogadores por clube',
      'page': DashboardPage1(),
    },
    {
      'title': 'Top 5 jogadores por competição',
      'page': DashboardPage2(),
    },
    {
      'title': 'Top 10 jogadores com menos registos',
      'page': DashboardPage3(),
    },
    {
      'title': 'Jogadores que efetuaram testes nos últimos 30 dias',
      'page': DashboardPage4(),
    },
    {
      'title': 'Jogadores sem controlo nos últimos 30 dias',
      'page': DashboardPage5(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ListView.builder(
        itemCount: dashboardOptions.length,
        itemBuilder: (BuildContext context, int index) {
          final option = dashboardOptions[index];
          return ListTile(
            title: Text(option['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => option['page']),
              );
            },
          );
        },
      ),
    );
  }
}
