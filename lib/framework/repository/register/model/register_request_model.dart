class RegisterRequestModel {
  String? username;
  String? email;
  String? password;
  String? confirmPassword;
  String? firstName;
  String? lastName;
  String? phone;
  DateTime? dateOfBirth;

  RegisterRequestModel({
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
    this.firstName,
    this.lastName,
    this.phone,
    this.dateOfBirth,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
    username: json["username"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirm_password"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "confirm_password": confirmPassword,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
  };
}