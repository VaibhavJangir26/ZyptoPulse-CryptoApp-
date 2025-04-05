import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zyptopulse/index.dart';
import '../../model/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavCryptoService{

  final String baseUrl = ApiKeys.authApi;
  final String collectionPath = '/items/crypto_favorites';

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'jwtToken');
  }

  Future<List<FavouriteModel>> fetchFavorites() async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$baseUrl$collectionPath'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((e)=>FavouriteModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load favorites');
    }
  }

  Future<void> addFavorite(FavouriteModel fav) async {
    final token=await getToken();
    final response= await http.post(
      Uri.parse('$baseUrl$collectionPath'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(fav.toJson()),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("failed to add to fav");
    }
  }

  Future<void> removeFavorite(String itemId) async {
    final token = await getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl$collectionPath/$itemId'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode != 200) {
      throw Exception('fail to delete from fav');
    }
  }
}
