import 'package:flutter/material.dart';
import 'package:mini_project/views/DashBoard/dashboardPages.dart';
import 'package:mini_project/views/EditPage/addPlayers.dart';
import 'package:mini_project/views/EditPage/deletePlayer.dart';
import 'package:mini_project/views/EditPage/editPlayers.dart';
import 'package:mini_project/views/Homepage/homepage.dart';
import 'package:mini_project/views/PositivePlayersPage/positivePlayersPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditPlayerPage(),
    );
  }
}
