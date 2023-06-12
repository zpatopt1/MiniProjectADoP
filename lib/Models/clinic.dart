
class Clinic {
  int id_clinic;
  String name;
  String address;

  Clinic({
    required this.id_clinic,
    required this.name,
    required this.address,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id_clinic: json['id_clinica'],
      name: json['nome'],
      address: json['morada'],
    );
  }
}