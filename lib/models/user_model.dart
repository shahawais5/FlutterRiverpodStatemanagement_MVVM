class User {
  final int id;
  final String email;
  final String name;
  final String role;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    name: json['name'],
    role: json['role'],
    avatar: json['avatar'],
  );
}
