class Email {
  final int id;
  final String email;
  final String phone;

  Email({required this.id, required this.email, required this.phone});

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(id: json['id'], email: json['email'], phone: json['phone']);
  }
}
