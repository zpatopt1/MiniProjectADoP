class Club {
  int id_club;
  String name;
  int teamId;

  Club({
    required this.id_club,
    required this.name,
    required this.teamId,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id_club: json['id_clube'],
      name: json['nome'],
      teamId: json['id_equipa'],
    );
  }
}