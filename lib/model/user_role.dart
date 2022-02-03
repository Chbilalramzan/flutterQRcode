class UserRole {
  int id;
  String name;
  String slug;
  int status;

  UserRole(
      {required this.id,
      required this.name,
      required this.slug,
      required this.status});

  UserRole copyWith(
    int id,
    String name,
    String slug,
    int status
  ) =>
      UserRole(
        id: this.id,
        name: '',
        slug: '',
        status: this.status,
      );

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      status: json['status']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'status': status,
      };
}
