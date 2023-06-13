import 'package:flutter/material.dart';

import '../DashBoard/jogadorSemControlo30DIAS.dart';
import '../DashBoard/numerosDeJogadoresQueFizeramAntiDoping.dart';
import '../DashBoard/quantidadeJogadoresPorClube.dart';
import '../DashBoard/top10_menos_controlos_por_equIpa.dart';
import '../DashBoard/top5_player_campship.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _goToNextPage() {
    _pageController.animateToPage(
      _currentPage + 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToPreviousPage() {
    _pageController.animateToPage(
      _currentPage - 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                DashboardPage1(),
                DashboardPage2(),
                DashboardPage3(),
                DashboardPage4(),
                DashboardPage5(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _currentPage > 0 ? _goToPreviousPage : null,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _currentPage < 4 ? _goToNextPage : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
