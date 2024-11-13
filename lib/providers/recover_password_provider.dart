import 'package:flutter/material.dart';

class RecoverPasswordProvider extends ChangeNotifier {
  Future<void> sendRecoveryEmail(BuildContext context, String email) async {
    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, insira um e-mail válido.')),
      );
      return;
    }

    // Simula a lógica de envio de e-mail de recuperação (pode ser substituído por uma chamada de API)
    try {
      await Future.delayed(Duration(seconds: 2)); // Simula o tempo de envio do e-mail
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Solicitação de recuperação de senha enviada.')),
      );

      // Navega para a página de recuperação de senha após o envio do e-mail
      Navigator.pushNamed(context, '/new_password');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar o e-mail: $e')),
      );
    }
  }
}
