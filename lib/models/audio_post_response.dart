// To parse this JSON data, do
//
//     final audioPostResponse = audioPostResponseFromJson(jsonString);

import 'dart:convert';

AudioPostResponse audioPostResponseFromJson(String str) => AudioPostResponse.fromJson(json.decode(str));

String audioPostResponseToJson(AudioPostResponse data) => json.encode(data.toJson());

class AudioPostResponse {
    bool? success;
    String? message;
    Results? results;

    AudioPostResponse({
        this.success,
        this.message,
        this.results,
    });

    factory AudioPostResponse.fromJson(Map<String, dynamic> json) => AudioPostResponse(
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
    int? user;
    int? audioPosting;

    Results({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.audioPosting,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"],
        audioPosting: json["audio_posting"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user,
        "audio_posting": audioPosting,
    };
}
