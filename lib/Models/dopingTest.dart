
class DopingTest {
  int id_test;
  DateTime testDate;
  int controlId;
  int clinicId;
  int laboratoryId;

  DopingTest({
    required this.id_test,
    required this.testDate,
    required this.controlId,
    required this.clinicId,
    required this.laboratoryId,
  });

  factory DopingTest.fromJson(Map<String, dynamic> json) {
    return DopingTest(
      id_test: json['id_teste'],
      testDate: DateTime.parse(json['dt_teste']),
      controlId: json['id_controlo'],
      clinicId: json['id_clinica'],
      laboratoryId: json['id_laboratorio'],
    );
  }
}