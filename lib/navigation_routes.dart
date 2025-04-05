import 'package:get/get.dart';
import 'package:zyptopulse/authentication/index.dart';
import 'package:zyptopulse/screens/index.dart';
import 'package:zyptopulse/screens/pages/index.dart';

class NavigationRoutes{

  static const home="/home";
  static const favourite="/favourite";
  static const setting="/setting";
  static const login="/login";
  static const signup="/signup";
  static const splash="/splash";
  static const welcome="/welcome";

  static List<GetPage> routes=[
    GetPage(name: home, page:()=> const HomeScreen()),
    GetPage(name: favourite, page:()=> const FavouriteScreen()),
    GetPage(name: setting, page:()=> const SettingScreen()),
    GetPage(name: login, page:()=> const LoginScreen()),
    GetPage(name: signup, page:()=> const SignupScreen()),
    GetPage(name: splash, page:()=> const SplashScreen()),
    GetPage(name: welcome, page:()=> const WelcomeScreen()),
  ];

}