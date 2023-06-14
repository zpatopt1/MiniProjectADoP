import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DashBoard/quantidadeJogadoresPorClube.dart';
import '../EditPage/addPlayers.dart';
import '../EditPage/deletePlayer.dart';
import '../EditPage/editPlayers.dart';

class PlayersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //chamar listview
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
                  //icon retroceder
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
                  // adicionar tópicos menu

                  // adicionar jogador
                  itemDashboard('Adicionar', CupertinoIcons.add, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayerAddPage()),
                    );
                  }),

                  // editar jogador
                  itemDashboard('Editar', CupertinoIcons.pencil, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPlayerPage()),
                    );
                  }),

                  // eliminar jogador
                  itemDashboard('Eliminar', CupertinoIcons.delete, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayerDeletePage()),
                    );
                  }),

                  // quantidade de jogadores por clube
                  itemDashboard('Quantidade Jogadores por Clube',
                      CupertinoIcons.profile_circled, Colors.black, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage1()),
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

  // criar tópicos para a dashboard
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
                // Widget ao centro
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
