import 'package:qrcode/model/user_role.dart';

class UserInfo {
  int id;
  String fname;
  String lname;
  String username;
  String email;
  String image;
  int roleId;
  UserRole userRole;

  UserInfo(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.username,
      required this.email,
      required this.image,
      required this.roleId,
      required this.userRole
      });

  UserInfo copyWith(
    int id,
    String fname,
    String lname,
    String username,
    String email,
    String image,
    int roleId,
    UserRole userRole
  ) =>
      UserInfo(
        id: this.id,
        fname: '',
        lname: '',
        username: '',
        email: '',
        image: '',
        roleId: this.roleId,
        userRole: this.userRole
      );

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
      roleId: json['role_id'],
      userRole: UserRole.fromJson(json['user_roles'])
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fname': fname,
        'lname': lname,
        'username': username,
        'email': email,
        'image': image,
        'role_id': roleId,
        'user_roles': UserRole
      };
}
