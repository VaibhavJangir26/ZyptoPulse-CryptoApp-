import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zyptopulse/reuse_ui_widgets/index.dart';
import '../reuse_widget/index.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          child: Stack(alignment: Alignment.topLeft, children: [

            // this is for show the top left green light
            Positioned(
              top: -height*0.05,
              left: -width*0.05,
              child: Container(
                width: width * 0.4,
                height: height * 0.4,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    radius: 3,
                    focal: Alignment.topLeft,
                    focalRadius: 0.5,
                    colors: [
                      Color(0xff5ED5A8),
                      Color(0x00000000),
                      Color(0x00000000),
                      Color(0x00000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // align the image properly
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/appImg/welcome_bg.png",
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        width: 106.05,
                        height: 230,
                      ),
                      Positioned(
                        top: 55,
                        child: Image.asset(
                          "assets/images/appImg/welcome_bg_main.png",
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                          width: 91.48,
                          height: 157.5,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Your account has been successfully created!",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // start button
                SizedBox(
                  width: width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5ED5A8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: (){
                      Get.offAll(()=>BottomNavigationBarSheet());
                    },
                    child: const CustomText(
                      text: "Get Started",
                      color: Color(0xff171D22),
                    ),
                  ),
                ),


              ],
            ),
          ]),
        ),
      ),
    );
  }
}
