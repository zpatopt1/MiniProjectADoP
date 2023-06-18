// import 'package:flutter/material.dart';
// import '../../data/addClubAPI.dart';
// import '../../data/positivePlayersAPI.dart';

// class ClubesPage extends StatefulWidget {
//   @override
//   _PositivePlayersState createState() => _PositivePlayersState();
// }

// class _PositivePlayersState extends State<ClubesPage> {
//   List<dynamic> ListClubes = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   void fetchData() async {
//     try {
//       // Atualizar a lista de jogadores positivos com os dados obtidos
//       final data = await ClubAddData.fetchPositivePlayers();
//       setState(() {
//         ListClubes = data;
//       });
//     } catch (error) {
//       print('Error fetching positive players: $error');
//       // Em caso de erro, avisar utilizador
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // exibir appbar a preto
//       appBar: AppBar(
//         title: Text('Jogadores Positivos'),
//         backgroundColor: Colors.black,
//       ),
//       // criar listview
//       body: ListView.builder(
//         itemCount: ListClubes.length,
//         itemBuilder: (context, index) {
//           final player = ListClubes[index];
//           return Card(
//             elevation: 4,
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Nome do jogador: ${player['nome_jogador']}',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   // buscar data à base de dados
//                   SizedBox(height: 8),
//                   Text('Clube: ${player['nome_clube']}'),
//                   Text('Equipa: ${player['nome_equipa']}'),
//                   Text('Data da colheita: ${player['data_colheita']}'),
//                   Text('Data do teste: ${player['data_teste']}'),
//                   Text('Laboratório de testagem: ${player['laboratorio']}'),
//                   Text('Substância: ${player['substancia_positiva']}'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }