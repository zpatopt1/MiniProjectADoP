import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DashBoard/jogadorSemControlo30DIAS.dart';
import '../DashBoard/quantidadeJogadoresPorClube.dart';
import '../DashBoard/top5_player_campship.dart';
import '../categoria/tops.dart';

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
                    'Hi Admin!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Welcome back!',
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
                  itemDashboard(
                      'Jogadores', CupertinoIcons.gamecontroller, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage1()),
                    );
                  }),
                  itemDashboard('Top', CupertinoIcons.up_arrow, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TopsPage()),
                    );
                  }),
                  itemDashboard(
                      '30 Dias', CupertinoIcons.calendar, Colors.black, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage5()),
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
              Text(
                title,
              ),
            ],
          ),
        ),
      );
}
