class User{
  final String email;
  final String name;
  final int id;
  final String website;

  User({
    required this.email,
    required this.name,
    required this.id,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      id: json['id'],
      website: json['website'],
    );
  }
}