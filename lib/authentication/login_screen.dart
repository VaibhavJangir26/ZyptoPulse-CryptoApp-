import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zyptopulse/authentication/index.dart';
import 'package:zyptopulse/methods/toast_msg.dart';
import 'package:zyptopulse/model/auth_model/index.dart';
import 'package:zyptopulse/index.dart';
import 'package:zyptopulse/reuse_ui_widgets/index.dart';
import 'package:zyptopulse/reuse_widget/index.dart';
import '../providers/auth_provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                ),

                Align(
                  alignment: Alignment.center,
                  child: switchBetweenLoginAndSignup(width, height),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CustomText(
                    text: "Sign in",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                  child: CustomText(text: "Email"),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CustomInputTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                  child: CustomText(text: "Password"),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: PasswordInputField(passwordController: passwordController),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomText(
                    text: "Forgot Password?",
                    color: Color(0xff5ED5A8),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: SizedBox(
                    width: width * 0.8,
                    child: Consumer<AuthService>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5ED5A8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            if (_loginFormKey.currentState!.validate()) {
                              final token=await authService.login(
                                LoginModel(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                              if (token!=null) {
                                Get.offAll(()=>BottomNavigationBarSheet());
                              } else {
                                ToastMsg.showToastMsg(
                                  "Login failed! \nCheck your email or password.",
                                );
                              }
                            }
                          },
                          child: value.isLoading
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                            ),
                          )
                              : const CustomText(text: "Sign in",color: Color(0xff171D22)),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }




  // widget to switch bw the login and signup screen
  Widget switchBetweenLoginAndSignup(double width, double height) {
    return Container(
      width: width*0.8,
      height: height*0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff161C22),
      ),
      child: ValueListenableBuilder<int>(
        valueListenable: SwitchController.currentScreenIndex,
        builder:(context,value,_){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // to highlight the button
              selectedButton(
                text: "Sign in",
                isSelectedButton: value == 0,
                onTap: () {
                  if (SwitchController.currentScreenIndex.value != 0) {
                    SwitchController.currentScreenIndex.value = 0;
                    Get.offNamed(NavigationRoutes.login);
                  }
                },
              ),
              selectedButton(
                text: "Sign up",
                isSelectedButton: value == 1,
                onTap: () {
                  if (SwitchController.currentScreenIndex.value != 1) {
                    SwitchController.currentScreenIndex.value = 1;
                    Get.offNamed(NavigationRoutes.signup);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget selectedButton({
    required String text,
    required bool isSelectedButton,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelectedButton ? const Color(0xff1B232A) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child:  CustomText(
          text: text,
          color: isSelectedButton ? Colors.black : const Color(0xff777777),
          fontWeight: isSelectedButton ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}

