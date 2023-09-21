import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
    bool? success;
    String? message;
    Results? results;

    SignUpResponse({
        this.success,
        this.message,
        this.results,
    });

    factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
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
    bool? success;
    String? verificationToken;

    Results({
        this.success,
        this.verificationToken,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        success: json["success"],
        verificationToken: json["verification_token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "verification_token": verificationToken,
    };
}
