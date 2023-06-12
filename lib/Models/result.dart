class Result {
  int id_result;
  String result;
  int substanceId;
  int testId;

  Result({
    required this.id_result,
    required this.result,
    required this.substanceId,
    required this.testId,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id_result: json['id_resultado'],
      result: json['resultado'],
      substanceId: json['id_substancia'],
      testId: json['id_teste'],
    );
  }
}