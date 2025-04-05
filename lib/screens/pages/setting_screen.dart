import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zyptopulse/providers/index.dart';
import 'package:zyptopulse/reuse_widget/index.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}


class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {

    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return Scaffold(

      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            leading: IconButton(onPressed: (){

            }, icon: const Icon(Icons.arrow_back)),
            title: const CustomText(text: "Setting",fontSize: 18,),
            centerTitle: false,
          )
      ),

      body: SafeArea(
        child: Column(
          children: [

            // this is app language listTile
            const ListTile(
              leading: Icon(Icons.language,color: Color(0xff5ED5A8),),
              title: Text("Language"),
              trailing: Icon(Icons.arrow_forward),
            ),

            Divider(indent: width*.18,),

            // this to change theme
            ListTile(
              leading: Image.asset(
                "assets/images/appImg/appearance.png",
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
              title: const Text("Appearance"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Get.bottomSheet(
                  elevation: 2,
                  Container(
                    width: width,
                    height: height * .2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Consumer<ThemeProvider>(
                      builder:(context,value,_){
                        return Column(
                          children: [
                            ListTile(
                              leading:const Icon(Icons.dark_mode, color: Colors.black54),
                              title: const CustomText(text: "Dark Theme"),
                              onTap:(){
                                value.changeTheme(ThemeMode.dark);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.light_mode, color: Colors.orange.shade500),
                              title: const CustomText(text: "Light Theme"),
                              onTap:(){
                                value.changeTheme(ThemeMode.light);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),



            Divider(indent: width*.18,),


            // this is about us listTile
            ListTile(
              leading: Image.asset("assets/images/appImg/group_img.png",fit: BoxFit.contain,filterQuality: FilterQuality.high,),
              title: const Text("About us"),
              trailing: const Icon(Icons.arrow_forward),
            ),


            Divider(indent: width*.18,),

            // logout button
            Consumer<AuthService>(
              builder:(context,value,_){
                return ListTile(
                  leading: const Icon(Icons.logout,color: Color(0xff5ED5A8),),
                  title: const Text("Logout"),
                  onTap: (){
                    value.logout();
                  },
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
