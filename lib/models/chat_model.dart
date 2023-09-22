class Chatmodel {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  Chatmodel({this.count, this.next, this.previous, this.results});

  Chatmodel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  Sender? sender;
  Receiver? receiver;
  String? createdAt;
  String? updatedAt;
  String? chat;
  bool? isRead;

  Results(
      {this.id,
        this.sender,
        this.receiver,
        this.createdAt,
        this.updatedAt,
        this.chat,
        this.isRead});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    chat = json['chat'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['chat'] = this.chat;
    data['is_read'] = this.isRead;
    return data;
  }
}

class Sender {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;

  Sender({this.id, this.name, this.email, this.phone, this.avatar});

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Receiver {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;

  Receiver({this.id, this.name, this.email, this.phone, this.avatar});

  Receiver.fromJson(Map<String, dynamic> json) {
    id = json['id']==null?'':json['id'];
    name = json['name']==null?'': json['name'];
    email = json['email']==null?'': json['email'];
    phone = json['phone']==null?'': json['phone'];
    avatar = json['avatar']==null?'': json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    return data;
  }
}