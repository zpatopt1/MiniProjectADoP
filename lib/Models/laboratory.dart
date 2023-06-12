
class Laboratory {
  int id_laboratory;
  String name;

  Laboratory({
    required this.id_laboratory,
    required this.name,
  });

  factory Laboratory.fromJson(Map<String, dynamic> json) {
    return Laboratory(
      id_laboratory: json['id_laboratorio'],
      name: json['nome'],
    );
  }
}