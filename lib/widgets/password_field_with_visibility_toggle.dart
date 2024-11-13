import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart'; // Importe o caminho correto do CustomTextField

class PasswordFieldWithVisibilityToggle extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  PasswordFieldWithVisibilityToggle({
    required this.controller,
    this.labelText = 'Senha',
    this.validator,
  });

  @override
  _PasswordFieldWithVisibilityToggleState createState() => _PasswordFieldWithVisibilityToggleState();
}

class _PasswordFieldWithVisibilityToggleState extends State<PasswordFieldWithVisibilityToggle> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      labelText: widget.labelText,
      isPassword: !_isPasswordVisible,
      suffixIcon: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
      validator: widget.validator,
    );
  }
}
