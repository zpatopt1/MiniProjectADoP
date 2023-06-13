
import 'package:flutter/material.dart';
import '../DashBoard/dashboardPages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Dopagem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardMobile(),
                  ),
                );
              },
              child: Text('Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
