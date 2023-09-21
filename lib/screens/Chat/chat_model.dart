// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  ChatModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
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
  Receiver? sender;
  Receiver? receiver;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? chat;
  bool? isRead;

  Result({
    this.id,
    this.sender,
    this.receiver,
    this.createdAt,
    this.updatedAt,
    this.chat,
    this.isRead,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    sender: json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
    receiver: json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    chat: json["chat"],
    isRead: json["is_read"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender": sender?.toJson(),
    "receiver": receiver?.toJson(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "chat": chat,
    "is_read": isRead,
  };
}

class Receiver {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;

  Receiver({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
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
