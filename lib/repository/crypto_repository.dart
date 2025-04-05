import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zyptopulse/model/index.dart';
import '../api_keys.dart';

class CryptoRepository {
  Future<List<CryptoModel>> fetchAllProducts() async {
    try {
      final response =await http.get(Uri.parse(ApiKeys.coinGeckoApi));
      if (response.statusCode==200) {
        final List<CryptoModel> cryptoList = (json.decode(response.body) as List)
            .map((json)=>CryptoModel.fromJson(json)).toList();
        return cryptoList;
      } else {
        throw Exception("failed to fetch the data${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
