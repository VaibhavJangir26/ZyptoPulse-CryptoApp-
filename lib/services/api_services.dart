
import 'dart:convert';
import 'package:zyptopulse/api_keys.dart';
import '../model/index.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  /// to fetch the crypto data
  Future<List<CryptoModel>> fetchCoinGeckoData() async{
    String baseUrl= ApiKeys.coinGeckoApi;
    try{
      var response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        var jsonData= jsonDecode(response.body);
        List<CryptoModel> crypto= (jsonData['crypto'] as List).map((json)=>CryptoModel.fromJson(jsonData)).toList();
        return crypto;
      }
      else{
        throw Exception("error occurred ${response.statusCode}");
      }
    }catch (e){
      throw Exception("failed to fetch data");
    }
  }


}


