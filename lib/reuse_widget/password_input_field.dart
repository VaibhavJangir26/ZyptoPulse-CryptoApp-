import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key,
  required this.passwordController,
  });
  final TextEditingController passwordController;
  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {


  final ValueNotifier<bool> isPasswordVisible= ValueNotifier<bool>(false);

  void showPassword(){
    isPasswordVisible.value=!isPasswordVisible.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isPasswordVisible,
      builder: (context,value,_){
        return TextFormField(
          controller: widget.passwordController,
          obscureText: value?false:true,
          keyboardType: TextInputType.visiblePassword,
          validator: (value){
            if(widget.passwordController.text.isEmpty){
              return "Enter the Password";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Enter your password",
              suffixIcon: IconButton(
                onPressed: showPassword,
                icon: value?const Icon(Icons.remove_red_eye):const Icon(CupertinoIcons.eye_slash_fill),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)
              )
          ),
        );
      },
    );
  }
}
