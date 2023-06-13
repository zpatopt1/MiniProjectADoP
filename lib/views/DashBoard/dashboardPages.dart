
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
      'title': 'Dashboard Page 1',
      'page': DashboardPage1(),
    },
    {
      'title': 'Dashboard Page 2',
      'page': DashboardPage2(),
    },
    {
      'title': 'Dashboard Page 3',
      'page': DashboardPage3(),
    },
    {
      'title': 'Dashboard Page 4',
      'page': DashboardPage4(),
    },
    {
      'title': 'Dashboard Page 5',
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
