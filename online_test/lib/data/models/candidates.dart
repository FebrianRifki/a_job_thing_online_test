class Candidate {
  final int id;
  final String name;
  final String gender;
  final String photo;
  final int brithDay;
  final int expired;

  Candidate(
      {required this.id,
      required this.name,
      required this.gender,
      required this.photo,
      required this.brithDay,
      required this.expired});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
        id: json['id'],
        name: json['name'],
        gender: json['gender'],
        photo: json['photo'],
        brithDay: json['birthday'],
        expired: json['expired']);
  }
}
