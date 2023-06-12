
class Doctor {
  int id_doctor;
  String name;
  int clinicId;

  Doctor({
    required this.id_doctor,
    required this.name,
    required this.clinicId,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id_doctor: json['id_medico'],
      name: json['nome'],
      clinicId: json['id_clinica'],
    );
  }
}