import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double maxWidth;

  CustomTextField({
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.suffixIcon,
    this.maxWidth = 400, // Largura máxima padrão
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: maxWidth,
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
