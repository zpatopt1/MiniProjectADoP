import 'package:flutter/material.dart';
import '../../data/Dashboard/dashboardAPI.dart';

class top10LessControlledByTeam extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<top10LessControlledByTeam> {
  Map<String, dynamic> dashboardData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // Chamar a função para buscar os dados
    final data = await Dashboard.fetchDashboardData();
    setState(() {
      // Atualizar o estado do widget com os dados obtidos
      dashboardData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> topPlayersByTeam =
        (dashboardData['top10JogadoresPorEquipe'] as List<dynamic>?)
                ?.cast<Map<String, dynamic>>()
                .toList() ??
            [];

    return Scaffold(
      // exibir AppBar
      appBar: AppBar(
        title: Text('Top 10'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                // exibir titulo
                'Jogadores Com Menos Registos De Controlo Por Equipa',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: topPlayersByTeam.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = topPlayersByTeam[index];

                  // Cria um Card para exibir as informações do jogador e a contagem de testes
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        item['nome_equipa'] ?? '', // Nome da equipa
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        // Mostrar nome do jogador e contagem de testes
                        'Jogador: ${item['nome_atleta'] ?? ''}, Total de Controlos: ${item['num_testes'] ?? 0}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
