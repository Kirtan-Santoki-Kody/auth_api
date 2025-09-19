import 'package:auth_api/framework/repository/register/model/token_model.dart';
import 'package:auth_api/framework/repository/register/model/user_model.dart';

class DataModel {
  String? message;
  UserModel? user;
  TokensModel? tokens;
  bool? emailVerificationRequired;

  DataModel({
    this.message,
    this.user,
    this.tokens,
    this.emailVerificationRequired,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    message: json["message"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    tokens: json["tokens"] == null ? null : TokensModel.fromJson(json["tokens"]),
    emailVerificationRequired: json["email_verification_required"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
    "tokens": tokens?.toJson(),
    "email_verification_required": emailVerificationRequired,
  };
}