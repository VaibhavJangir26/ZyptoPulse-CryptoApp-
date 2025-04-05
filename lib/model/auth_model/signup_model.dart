class SignupModel {
  final String email;
  final String password;
  final String role;
  final String firstName;

  SignupModel({
    required this.email,
    required this.password,
    required this.role,
    required this.firstName,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      email: json['email'],
      password: json['password'],
      role: json['role'],
      firstName: json['first_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
      'first_name': firstName,
    };
  }
}
