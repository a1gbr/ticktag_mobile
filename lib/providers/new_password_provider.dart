import 'package:flutter/material.dart';

class NewPasswordProvider extends ChangeNotifier {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a nova senha.';
    } else if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }
    return null;
  }

  String? validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, repita a nova senha.';
    } else if (value != newPasswordController.text) {
      return 'As senhas não coincidem.';
    }
    return null;
  }

  void saveNewPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Lógica de salvamento da senha
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nova senha salva com sucesso!')),
      );
      Navigator.pop(context);
      notifyListeners();
    }
  }
}
