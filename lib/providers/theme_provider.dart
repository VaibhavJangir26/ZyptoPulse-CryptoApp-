
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{


  ThemeMode _currentTheme=ThemeMode.dark;
  ThemeMode get currentTheme=> _currentTheme;

  void changeTheme(ThemeMode theme){
    _currentTheme=theme;
    notifyListeners();
  }

  Future<void> saveThemeData(ThemeMode theme)async{
    var prefs=await SharedPreferences.getInstance();
    prefs.setBool("myTheme", theme==ThemeMode.dark);
  }

  Future<void> loadThemeData() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkTheme = prefs.getBool("myTheme")??true;
    _currentTheme = isDarkTheme?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }



}