class DopingSubstance {
  int id_substance;
  String name;

  DopingSubstance({
    required this.id_substance,
    required this.name,
  });

  factory DopingSubstance.fromJson(Map<String, dynamic> json) {
    return DopingSubstance(
      id_substance: json['id_substancia'],
      name: json['nome'],
    );
  }
}
