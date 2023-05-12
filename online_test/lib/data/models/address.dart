class Address {
  final int id;
  final String address;
  final String city;
  final String state;
  final int zipCode;

  Address(
      {required this.id,
      required this.address,
      required this.city,
      required this.state,
      required this.zipCode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'],
        address: json['address'],
        city: json['city'],
        state: json['state'],
        zipCode: json['zip_code']);
  }
}
