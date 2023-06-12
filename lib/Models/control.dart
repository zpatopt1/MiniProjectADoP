class Control {
  int id_control;
  DateTime controlDate;
  int clubId;
  int championshipId;
  int athleteCC;

  Control({
    required this.id_control,
    required this.controlDate,
    required this.clubId,
    required this.championshipId,
    required this.athleteCC,
  });

  factory Control.fromJson(Map<String, dynamic> json) {
    return Control(
      id_control: json['id_controlo'],
      controlDate: DateTime.parse(json['dt_controlo']),
      clubId: json['id_clube'],
      championshipId: json['id_campeonato'],
      athleteCC: json['CC_atleta'],
    );
  }
}
