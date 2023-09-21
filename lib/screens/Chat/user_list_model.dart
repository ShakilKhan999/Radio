// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  bool? success;
  String? message;
  Results? results;

  UserListModel({
    this.success,
    this.message,
    this.results,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    success: json["success"],
    message: json["message"],
    results: json["results"] == null ? null : Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "results": results?.toJson(),
  };
}

class Results {
  List<User>? users;

  Results({
    this.users,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class User {
  int? id;
  dynamic name;
  String? email;
  String? phone;
  dynamic avatar;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "avatar": avatar,
  };
}
