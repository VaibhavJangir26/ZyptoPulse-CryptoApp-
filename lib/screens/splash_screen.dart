import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyptopulse/navigation_routes.dart';
import 'package:zyptopulse/reuse_widget/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(NavigationRoutes.login);
    });
  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: width,
        height: height,
        color: const Color(0xff1B232A),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children:
          [

          Image.asset(
              "assets/images/appImg/bg_splash_screen.png",
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
              width: width,
              height: height,
            ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Center(
                child: Image.asset("assets/images/appLogo/appLogo.png",
                  fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                width: width*.25,
                height: height*.25,
                ),
              ),
              const CustomText(text: "ZyptoPulse",fontWeight: FontWeight.bold,fontSize: 35,color: Color(0xff5ED5A8),),

            ]
          ),

            Container(
              width: width,
              height: height*.2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0x00000000),
                      Color(0xff5ED5A8),
                    ]
                ),
              ),
            ),
          ]
        ),
      ),
    )
    );
  }
}
