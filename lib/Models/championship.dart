class Championship {
  int id_campionship;
  String name;

  Championship({
    required this.id_campionship,
    required this.name,
  });

  factory Championship.fromJson(Map<String, dynamic> json) {
    return Championship(
      id_campionship: json['id_campeonato'],
      name: json['nome'],
    );
  }
}