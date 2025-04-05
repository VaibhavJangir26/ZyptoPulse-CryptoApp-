import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zyptopulse/index.dart';
import 'package:zyptopulse/methods/toast_msg.dart';
import '../authentication/index.dart';
import '../model/auth_model/index.dart';



class AuthService extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final String baseUrl = ApiKeys.authApi;

  Future<bool> signup(SignupModel signupModel) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signupModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
        return true;
      }
      else{
        ToastMsg.showToastMsg("error");
        return false;
      }
    }
    catch (e){
      ToastMsg.showToastMsg(e.toString());
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<TokenResponseModel?> login(LoginModel loginModel) async {
    final url = Uri.parse('$baseUrl/auth/login');
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginModel.toJson()),
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return TokenResponseModel.fromJson(jsonResponse);
      } else {
        ToastMsg.showToastMsg("error");
        return null;
      }
    } catch (e) {
      ToastMsg.showToastMsg(e.toString());
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  final JwtTokenStorageHelper jwtToken = JwtTokenStorageHelper();
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    try {
      await jwtToken.deleteToken();
      Get.offAllNamed(NavigationRoutes.login);
      ToastMsg.showToastMsg("logout successfully");
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }



}

