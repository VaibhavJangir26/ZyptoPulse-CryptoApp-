import 'package:flutter/material.dart';
class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({super.key,
  required this.controller,
  this.prefixIcon,
  this.hintText,
  this.textInputType,
  this.obscureText,
  });

  final TextEditingController controller;
  final Icon? prefixIcon;
  final String? hintText;
  final TextInputType? textInputType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: (value){
        if(value!.isEmpty){
          return "Field is required";
        }
        return null;
      },
      obscureText: obscureText??false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        )
      ),
    );
  }
}
