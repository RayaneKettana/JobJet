class Customer {
  final String firstName;
  final String lastName;
  final String? email;
  final String phoneNumber;
  final String? address;

  Customer({
    required this.firstName,
    required this.lastName,
    this.email,
    required this.phoneNumber,
    required this.address,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'address': address,
      };
}
