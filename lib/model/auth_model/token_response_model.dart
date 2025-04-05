class TokenResponseModel {
  final String accessToken;
  final String refreshToken;

  TokenResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return TokenResponseModel(
      accessToken: data['access_token'],
      refreshToken: data['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
