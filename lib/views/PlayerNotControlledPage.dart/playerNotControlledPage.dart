import 'package:flutter/material.dart';
import '../../Models/player.dart';
import '../../data/playerNotControlledAPI.dart';

class PlayerNotControlledPage extends StatefulWidget {
  @override
  _PlayerNotControlledPageState createState() =>
      _PlayerNotControlledPageState();
}

class _PlayerNotControlledPageState extends State<PlayerNotControlledPage> {
  TextEditingController daysController = TextEditingController();
  int days = 0;
  List<Player> players = [];
  bool isLoading = false;

  Future<void> fetchPlayersNotControlled() async {
    setState(() {
      isLoading = true;
      players = [];
    });

    days = int.parse(daysController.text);

    try {
      // Tentar buscar jogadores não controlados
      players = await PlayerService.getPlayersNotControlled(days);
    } catch (error) {
      // Escrever  erro
      print('Error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Criação AppBar
      appBar: AppBar(
        title: Text('Jogadores Não Controlados'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibe texto informativo
            TextField(
              controller: daysController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número de dias',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: fetchPlayersNotControlled,
              child: Text('Buscar'),
            ),
            SizedBox(height: 16.0),
            if (isLoading)
              // Mostra um indicador de progresso circular se isLoading for verdadeiro
              CircularProgressIndicator()
            else if (players.isEmpty)
              // Mostra uma mensagem se a lista de jogadores estiver vazia
              Text('Nenhum jogador encontrado.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          player.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //chamar base de dados
                        subtitle: Text('CC: ${player.cc_player}'),
                        trailing: Text('Clube: ${player.clubId}'),
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
