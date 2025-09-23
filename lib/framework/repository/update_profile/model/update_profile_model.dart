class UpdateProfileModel {
  bool? success;
  String? message;
  Data? data;
  DateTime? timestamp;

  UpdateProfileModel({this.success, this.message, this.data, this.timestamp});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "timestamp": timestamp?.toIso8601String(),
  };
}

class Data {
  String? message;
  User? user;

  Data({this.message, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {"message": message, "user": user?.toJson()};
}

class User {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  DateTime? dateOfBirth;
  dynamic profileImage;
  int? isActive;
  int? isVerified;
  DateTime? lastLogin;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.dateOfBirth,
    this.profileImage,
    this.isActive,
    this.isVerified,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    dateOfBirth: json["date_of_birth"] == null
        ? null
        : DateTime.parse(json["date_of_birth"]),
    profileImage: json["profile_image"],
    isActive: json["is_active"],
    isVerified: json["is_verified"],
    lastLogin: json["last_login"] == null
        ? null
        : DateTime.parse(json["last_login"]),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "date_of_birth": dateOfBirth?.toIso8601String(),
    "profile_image": profileImage,
    "is_active": isActive,
    "is_verified": isVerified,
    "last_login": lastLogin?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
