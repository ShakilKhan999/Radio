import 'dart:convert';

UserAudioResponse userAudioResponseFromJson(String str) => UserAudioResponse.fromJson(json.decode(str));

String userAudioResponseToJson(UserAudioResponse data) => json.encode(data.toJson());

class UserAudioResponse {
    int? count;
    dynamic next;
    dynamic previous;
    List<Result>? results;

    UserAudioResponse({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory UserAudioResponse.fromJson(Map<String, dynamic> json) => UserAudioResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    int? id;
    User? user;
    AudioPosting? audioPosting;
    DateTime? createdAt;
    DateTime? updatedAt;

    Result({
        this.id,
        this.user,
        this.audioPosting,
        this.createdAt,
        this.updatedAt,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        audioPosting: json["audio_posting"] == null ? null : AudioPosting.fromJson(json["audio_posting"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "audio_posting": audioPosting?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class AudioPosting {
    int? id;
    int? category;
    int? user;
    String? title;

    AudioPosting({
        this.id,
        this.category,
        this.user,
        this.title,
    });

    factory AudioPosting.fromJson(Map<String, dynamic> json) => AudioPosting(
        id: json["id"],
        category: json["category"],
        user: json["user"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "user": user,
        "title": title,
    };
}

class User {
    int? id;
    String? name;
    String? email;
    String? phone;
    String? avatar;

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
