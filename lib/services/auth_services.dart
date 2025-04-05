import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zyptopulse/api_keys.dart';
import 'package:zyptopulse/methods/toast_msg.dart';
import '../model/auth_model/index.dart';


class AuthService{

  final String baseUrl = ApiKeys.authApi;

  Future<bool> signup(SignupModel signupModel) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signupModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        ToastMsg.showToastMsg("sign up failed");
        return false;
      }
    } catch (e) {
      ToastMsg.showToastMsg(e.toString());
      return false;
    }
  }


  Future<TokenResponseModel?> login(LoginModel loginModel) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginModel.toJson()),
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return TokenResponseModel.fromJson(jsonResponse);
      } else {
        ToastMsg.showToastMsg("login fail");
        return null;
      }
    } catch (e) {
      ToastMsg.showToastMsg(e.toString());
      return null;
    }
  }



}
