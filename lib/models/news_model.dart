import 'dart:io';
//News Model

class News {
  int? id;
  Category? category;
  User? user;
  String? createdAt;
  String? updatedAt;
  String? title;
  bool? isPublished;
  String? subtitle;
  String? image;
  String? description;

  News(
      {this.id,
        this.category,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.isPublished,
        this.subtitle,
        this.image,
        this.description});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    isPublished = json['is_published'];
    subtitle = json['subtitle'];
    image = json['image'];
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
    data['is_published'] = this.isPublished;
    data['subtitle'] = this.subtitle;
    data['image'] = this.image;
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

//create news model
class CreateNewsModel {
  final String category;
  final String user;
  final String title;
  final String subtitle;
  final String description;
  final File image;

  CreateNewsModel({
    required this.category,
    required this.user,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });
}


class CategoryName {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? icon;
  String? description;

  CategoryName({this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.icon,
    this.description});

  CategoryName.fromJson(Map<String, dynamic> json) {
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