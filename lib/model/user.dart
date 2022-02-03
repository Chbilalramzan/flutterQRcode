
class User {
  int id;
  String username;
  String password;

  User(
      {required this.id,
      required this.username,
      required this.password
      });

  User copyWith(
    int id,
    String username,
    String password,
  ) =>
      User(
        id: this.id,
        username: '',
        password: '',
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
      };
}
