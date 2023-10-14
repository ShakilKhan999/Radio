// To parse this JSON data, do
//
//     final jobResponse = jobResponseFromJson(jsonString);

import 'dart:convert';

JobResponse jobResponseFromJson(String str) => JobResponse.fromJson(json.decode(str));

String jobResponseToJson(JobResponse data) => json.encode(data.toJson());

class JobResponse {
    bool? success;
    String? message;
    Results? results;

    JobResponse({
        this.success,
        this.message,
        this.results,
    });

    factory JobResponse.fromJson(Map<String, dynamic> json) => JobResponse(
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
    String? name;
    String? email;
    String? phone;
    String? education;
    String? experience;
    String? note;
    String? skill;
    String? applyAs;
    String? officialEmail;
    int? user;

    Results({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.email,
        this.phone,
        this.education,
        this.experience,
        this.note,
        this.skill,
        this.applyAs,
        this.officialEmail,
        this.user,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        education: json["education"],
        experience: json["experience"],
        note: json["note"],
        skill: json["skill"],
        applyAs: json["apply_as"],
        officialEmail: json["official_email"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
        "email": email,
        "phone": phone,
        "education": education,
        "experience": experience,
        "note": note,
        "skill": skill,
        "apply_as": applyAs,
        "official_email": officialEmail,
        "user": user,
    };
}
