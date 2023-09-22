// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromJson(jsonString);

import 'dart:convert';

OtpResponse otpResponseFromJson(String str) => OtpResponse.fromJson(json.decode(str));

String otpResponseToJson(OtpResponse data) => json.encode(data.toJson());

class OtpResponse {
    bool? success;
    String? message;
    Results? results;

    OtpResponse({
        this.success,
        this.message,
        this.results,
    });

    factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
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
    String? message;
    User? user;
    String? token;

    Results({
        this.message,
        this.user,
        this.token,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "token": token,
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

    User({
        this.id,
        this.email,
        this.phone,
        this.avatar,
        this.name,
        this.isVerified,
        this.dob,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
        name: json["name"],
        isVerified: json["is_verified"],
        dob: json["dob"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "name": name,
        "is_verified": isVerified,
        "dob": dob,
    };
}
