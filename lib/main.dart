
import 'package:flutter/material.dart';
import 'package:mini_project/data/Desktop/CompetitionTestedAPI.dart';
import 'package:mini_project/views/Desktop/CompetitionTestedPage.dart';
import 'package:mini_project/views/Desktop/LabsTest.dart';
import 'package:mini_project/views/Desktop/TopPositiveSubstances.dart';
import 'package:mini_project/views/Desktop/timePositivePlayers.dart';
import 'package:mini_project/views/Desktop/listPlayerSubstancia.dart';
import 'package:mini_project/views/Desktop/listTestedPlayerByCompetion.dart';
import 'package:mini_project/views/EditPage/addClub.dart';
import 'package:mini_project/views/EditPage/addPlayers.dart';
import 'package:mini_project/views/PlayerNotControlledPage.dart/playerNotControlledPage.dart';
import 'package:mini_project/views/PositivePlayersPage/positivePlayersPage.dart';

import 'views/Homepage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
