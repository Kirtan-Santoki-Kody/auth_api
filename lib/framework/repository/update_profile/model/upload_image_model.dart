class UploadImageModel {
  bool? success;
  String? message;
  Data? data;
  DateTime? timestamp;

  UploadImageModel({this.success, this.message, this.data, this.timestamp});

  factory UploadImageModel.fromJson(Map<String, dynamic> json) =>
      UploadImageModel(
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
  ProfileImage? profileImage;

  Data({this.message, this.profileImage});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    profileImage: json["profile_image"] == null
        ? null
        : ProfileImage.fromJson(json["profile_image"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "profile_image": profileImage?.toJson(),
  };
}

class ProfileImage {
  String? url;
  int? width;
  int? height;

  ProfileImage({this.url, this.width, this.height});

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}
