class ApiResponse {
  final String message;
  final int status;
  final bool isSuccess;
  final dynamic errors; // Use `dynamic` if the type can vary or is unknown
  final UserData? data;

  ApiResponse({
    required this.message,
    required this.status,
    required this.isSuccess,
    this.errors,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      message: json['message'],
      status: json['status'],
      isSuccess: json['isSuccess'],
      errors: json['errors'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final int roleId;
  final dynamic
      passwordHash; // Use `dynamic` if the type can vary or is unknown
  final String? image;

  UserData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.roleId,
    this.passwordHash,
    this.image,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      roleId: json['roleId'],
      passwordHash: json['passwordHash'],
      image: json['image'],
    );
  }
}
