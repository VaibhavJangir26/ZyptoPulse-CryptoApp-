import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtTokenStorageHelper {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final String tokenKey = 'jwtToken';

  /// this will save the token in flutter_storage
  Future<void> saveToken(String token) async {
    try {
      await storage.write(key: tokenKey, value: token);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // to fetch or get the token
  Future<String?> getToken() async {
    try {
      return await storage.read(key: tokenKey);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // to delete the saved token
  Future<void> deleteToken() async {
    try {
      await storage.delete(key: tokenKey);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
