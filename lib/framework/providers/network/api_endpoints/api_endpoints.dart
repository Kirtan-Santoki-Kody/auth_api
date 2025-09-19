class ApiEndpoints{
  static final baseUrl = 'http://192.168.1.113:3000';

  static final register = '$baseUrl/api/auth/register';
  static final login = '$baseUrl/api/auth/login';
  static final logout = '$baseUrl/api/auth/logout';
  static final getProfile = '$baseUrl/api/users/profile';
  static final updateProfile = '$baseUrl/api/users/profile';
  static final updateProfileImage = '$baseUrl/api/users/profile/upload-image';
}