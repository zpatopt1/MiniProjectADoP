import 'package:flutter/material.dart';
import 'package:mini_project/views/Homepage/homepage.dart';
import 'package:mini_project/views/PositivePlayersPage/positivePlayersPage.dart';
import 'package:mini_project/views/PlayerNotControlledPage.dart/playerNotControlledPage.dart';

import 'views/randomControls5players/5randomplayerscontrolpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlayerNotControlledPage(),
    );
  }
}
