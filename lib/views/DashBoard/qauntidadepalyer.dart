import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardPage1 extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage1> {
  Map<String, dynamic> dashboardData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/dashboard'));
      if (response.statusCode == 200) {
        setState(() {
          dashboardData = json.decode(response.body);
        });
      } else {
        print('Erro ao buscar os dados da dashboard');
      }
    } catch (e) {
      print('Erro na conexão com a API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Jogadores por Clube',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            dashboardData['jogadoresPorClube']?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final item =
                              dashboardData['jogadoresPorClube'][index];
                          return ListTile(
                            title: Text(item['nome']),
                            subtitle: Text(
                                'Quantidade de jogadores: ${item['quantidade_jogadores']}'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


