import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zyptopulse/authentication/index.dart';
import 'package:zyptopulse/index.dart';
import 'package:zyptopulse/methods/toast_msg.dart';
import 'package:zyptopulse/reuse_widget/index.dart';
import '../model/auth_model/index.dart';
import '../providers/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _signupFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.close),
              ),


              Align(
                alignment: Alignment.center,
                child: switchBetweenLoginAndSignup(width, height),
              ),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomText(
                  text: "Sign up",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),


              Form(
                key: _signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                      child: CustomText(text: "Full Name"),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: CustomInputTextField(
                        controller: nameController,
                        hintText: "Enter your full name",
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
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                      child: CustomText(text: "Password"),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: PasswordInputField(
                        passwordController: passwordController,
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 20),


              Consumer<AuthService>(
                builder: (context, value, _) {
                  return Center(
                    child: SizedBox(
                      width: width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff5ED5A8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed:() async {
                          if (_signupFormKey.currentState!.validate()){
                            final success = await value.signup(
                              SignupModel(
                                email: emailController.text.trim(),
                                firstName: nameController.text.trim(),
                                password: passwordController.text.trim(),
                                role: 'bf6c3d87-3564-43ac-a172-5614bbc40811',
                              ),
                            );
                            if (success) {
                              ToastMsg.showToastMsg("success \n  account created successfully");
                              Get.offNamed(NavigationRoutes.welcome);
                            } else {
                              ToastMsg.showToastMsg("failed \n  signup failed try again");
                            }
                          }
                        },
                        child: value.isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.black,
                          ),
                        ) : const CustomText(
                          text: "Sign up",
                          color: Color(0xff171D22),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


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
        builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                isSelectedButton:value==1,
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
        child: CustomText(
          text: text,
          color: isSelectedButton ? Colors.black : const Color(0xff777777),
          fontWeight: isSelectedButton ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}
