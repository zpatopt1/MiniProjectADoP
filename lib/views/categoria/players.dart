import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../EditPage/addPlayers.dart';
import '../EditPage/deletePlayer.dart';
import '../EditPage/editPlayers.dart';

class PlayersPage extends StatelessWidget {
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
                      'Adicionar', CupertinoIcons.profile_circled, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayerAddPage()),
                    );
                  }),
                  itemDashboard(
                      'Editar', CupertinoIcons.profile_circled, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPlayerPage()),
                    );
                  }),
                  itemDashboard(
                      'Eliminar', CupertinoIcons.profile_circled, Colors.black,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayerDeletePage()),
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
              Center(
                // Add a Center widget here
                child: Text(
                  title,
                  textAlign:
                      TextAlign.center, // Set the text alignment to center
                ),
              ),
            ],
          ),
        ),
      );
}
