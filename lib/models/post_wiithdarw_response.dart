// To parse this JSON data, do
//
//     final postWithdrawResponse = postWithdrawResponseFromJson(jsonString);

import 'dart:convert';

PostWithdrawResponse postWithdrawResponseFromJson(String str) => PostWithdrawResponse.fromJson(json.decode(str));

String postWithdrawResponseToJson(PostWithdrawResponse data) => json.encode(data.toJson());

class PostWithdrawResponse {
    bool? success;
    String? message;
    Results? results;

    PostWithdrawResponse({
        this.success,
        this.message,
        this.results,
    });

    factory PostWithdrawResponse.fromJson(Map<String, dynamic> json) => PostWithdrawResponse(
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
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? amount;
    int? coins;
    String? withdrawType;
    String? withdrawNumber;
    int? user;

    Results({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.amount,
        this.coins,
        this.withdrawType,
        this.withdrawNumber,
        this.user,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        amount: json["amount"],
        coins: json["coins"],
        withdrawType: json["withdraw_type"],
        withdrawNumber: json["withdraw_number"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "amount": amount,
        "coins": coins,
        "withdraw_type": withdrawType,
        "withdraw_number": withdrawNumber,
        "user": user,
    };
}
