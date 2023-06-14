import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/PositivePlayersPage/positivePlayersPage.dart';
import '../DashBoard/numerosDeJogadoresQueFizeramAntiDoping.dart';
import '../DashBoard/top10_menos_controlos_por_equIpa.dart';
import '../DashBoard/top5_player_campship.dart';

class TopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // chamar listview
          ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context); // ir para a página anterior
                    },
                  ),
                  title: Text(
                    'Olá Admin!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Bem-vindo!',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                  trailing: CircleAvatar(
                      radius: 30,
                      backgroundImage: const AssetImage('images/logo.jpg')),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  // tópicos menu

                  // jogadores com mais registos por competição
                  itemDashboard('Jogadores Com Mais Registos Por Competição',
                      CupertinoIcons.profile_circled, Colors.black, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage2()),
                    );
                  }),
                  // jogadores com menos registos por competição
                  itemDashboard('Jogadores Com Menos Registos Por Competição',
                      CupertinoIcons.profile_circled, Colors.black, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage3()),
                    );
                  }),
                  // jogadores com teste positivo
                  itemDashboard(
                      'Positivos', CupertinoIcons.check_mark, Colors.black, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PositivePlayers()),
                    );
                  }),
                  // jogadores testados
                  itemDashboard('Testados', CupertinoIcons.doc, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage4()),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // criação tópicos para dashboar
  itemDashboard(
    String title,
    IconData iconData,
    Color background,
    VoidCallback onPressed,
  ) =>
      GestureDetector(
        onTap:
            onPressed, // Assign the onPressed callback to the GestureDetector's onTap
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: background, shape: BoxShape.circle),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                // Centrar Widget
                child: Text(
                  title,
                  textAlign: TextAlign.center, // alinhar texto ao centro
                ),
              ),
            ],
          ),
        ),
      );
}
