import 'dart:convert';

RegisterUser registerUserFromJson(String str) =>
    RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  String? message;
  UserR? user;
  String? token;

  RegisterUser({
    this.message,
    this.user,
    this.token,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        message: json["message"],
        user: json["user"] == null ? null : UserR.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "token": token,
      };
}

class UserR {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserR({
    this.name,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory UserR.fromJson(Map<String, dynamic> json) => UserR(
        name: json["name"],
        email: json["email"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
