import 'package:hive/hive.dart';

part 'token_model.g.dart';

@HiveType(typeId: 0)
class TokensModel {
  @HiveField(0)
  String? accessToken;
  @HiveField(1)
  String? refreshToken;
  @HiveField(2)
  String? tokenType;
  @HiveField(3)
  String? expiresIn;

  TokensModel({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}