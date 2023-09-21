class UpcomingShow {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String title;
  final String subtitle;
  final String dateTime;
  final String image;
  final String description;

  UpcomingShow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.image,
    required this.description,
  });

  factory UpcomingShow.fromJson(Map<String, dynamic> json) {
    return UpcomingShow(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      dateTime: json['date_time'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }
}


class Results {
  int? id;
  Category? category;
  User? user;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? subtitle;
  String? audioFile;
  String? image;
  int? playCount;
  String? description;

  Results(
      {this.id,
        this.category,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.subtitle,
        this.audioFile,
        this.image,
        this.playCount,
        this.description});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    subtitle = json['subtitle'];
    audioFile = json['audio_file'];
    image = json['image'];
    playCount = json['play_count'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['audio_file'] = this.audioFile;
    data['image'] = this.image;
    data['play_count'] = this.playCount;
    data['description'] = this.description;
    return data;
  }
}

class Category {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? icon;
  String? description;

  Category(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.icon,
        this.description});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['description'] = this.description;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;

  User({this.id, this.name, this.email, this.phone, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
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

