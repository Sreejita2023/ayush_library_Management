class user {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  user({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  // Factory constructor for creating a user instance from a JSON object
  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  // Method to convert user object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
