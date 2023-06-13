class Player {
  int cc_player;
  String name;
  DateTime dateOfBirth;
  bool isActive;
  int clubId;

  Player({
    required this.cc_player,
    required this.name,
    required this.dateOfBirth,
    required this.isActive,
    required this.clubId,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      cc_player: json['CC_atleta'],
      name: json['nome'],
      dateOfBirth: DateTime.parse(json['dt_nasc']),
      isActive: json['1'] == 1,
      clubId: json['id_clube'],
    );
  }
}
