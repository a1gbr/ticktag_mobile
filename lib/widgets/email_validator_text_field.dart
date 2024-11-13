import 'package:flutter/material.dart';

import 'custom_text_field.dart'; // Importe o caminho correto do CustomTextField

class EmailValidatorTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  EmailValidatorTextField({
    required this.controller,
    this.labelText = 'E-mail',
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      labelText: labelText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira seu e-mail.';
        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(value)) {
          return 'Por favor, insira um e-mail válido.';
        }
        return null;
      },
    );
  }
}
