class FundraiserModel {
  int count;
  List<FundraiserResult> results;

  FundraiserModel({
    required this.count,
    required this.results,
  });

  factory FundraiserModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsList = json['results'];
    List<FundraiserResult> results = resultsList
        .map((result) => FundraiserResult.fromJson(result))
        .toList();

    return FundraiserModel(
      count: json['count'],
      results: results,
    );
  }

  Map<String, dynamic> toJson() {
    List<dynamic> resultsList = results.map((result) => result.toJson()).toList();

    return {
      'count': count,
      'results': resultsList,
    };
  }
}

class FundraiserResult {
  int id;
  User user;
  DateTime createdAt;
  DateTime updatedAt;
  String amount;
  String paymentMethod;
  String paymentNumber;
  String category;

  FundraiserResult({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.amount,
    required this.paymentMethod,
    required this.paymentNumber,
    required this.category,
  });

  factory FundraiserResult.fromJson(Map<String, dynamic> json) {
    return FundraiserResult(
      id: json['id'],
      user: User.fromJson(json['user']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      amount: json['amount'],
      paymentMethod: json['payment_method'],
      paymentNumber: json['payment_number'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'amount': amount,
      'payment_method': paymentMethod,
      'payment_number': paymentNumber,
      'category': category,
    };
  }
}

class User {
  int id;
  String? name;
  String? email;
  String? phone;
  String? avatar;

  User({
    required this.id,
    this.name,
    required this.email,
    this.phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }
}
