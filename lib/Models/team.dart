class Team {
  int id_team;
  String name;

  Team({
    required this.id_team,
    required this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id_team: json['id_equipa'],
      name: json['nome'],
    );
  }
}