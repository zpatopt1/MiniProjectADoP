import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DashBoard/quantidadeJogadoresPorClube.dart';
import '../PlayerNotControlledPage.dart/playerNotControlledPage.dart';
import '../categoria/players.dart';
import '../categoria/tops.dart';
import '../randomControls5players/5randomplayerscontrolpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  title: Text(
                    'Olá Admin!',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Bem-vindo!',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.white54),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/logo.jpg'),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                    'Gestão de Jogadores',
                    CupertinoIcons.profile_circled,
                    Colors.black,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlayersPage()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Testes',
                    CupertinoIcons.doc,
                    Colors.black,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TopsPage()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Sortear Jogadores',
                    CupertinoIcons.loop_thick,
                    Colors.black,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RandomPlayer_1week()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Jogadores Não Controlados',
                    CupertinoIcons.nosign,
                    Colors.black,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerNotControlledPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemDashboard(
    String title,
    IconData iconData,
    Color background,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
