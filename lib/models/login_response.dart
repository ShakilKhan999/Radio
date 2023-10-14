import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool? success;
  String? message;
  Results? results;

  LoginResponse({
    this.success,
    this.message,
    this.results,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "results": results?.toJson(),
      };
}

class Results {
  String? token;
  User? user;

  Results({
    this.token,
    this.user,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? email;
  String? phone;
  dynamic avatar;
  dynamic name;
  bool? isVerified;
  dynamic dob;
  dynamic referralId;
  dynamic totalCoins;

  User({
    this.id,
    this.email,
    this.phone,
    this.avatar,
    this.name,
    this.isVerified,
    this.dob,
    this.referralId,
    this.totalCoins,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
        name: json["name"],
        isVerified: json["is_verified"],
        dob: json["dob"],
        referralId: json["referral_id"],
        totalCoins: json["total_coins"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "name": name,
        "is_verified": isVerified,
        "dob": dob,
        "referral_id": referralId,
        "total_coins": totalCoins,
      };
}
