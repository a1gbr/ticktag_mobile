import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticktag_mobile/widgets/custom_app_bar.dart';

import '../../providers/auth_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox_with_text.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  bool _agreeToTerms = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (!_agreeToTerms) {
        _showSnackBar('Você precisa concordar com os termos.');
        return;
      }

      try {
        await Provider.of<AuthProvider>(context, listen: false).register(
          _emailController.text,
          _passwordController.text,
          _birthDateController.text,
        );
        _showSnackBar('Registro bem-sucedido!');
        Navigator.pushReplacementNamed(context, '/');
      } catch (e) {
        _showSnackBar('Erro no registro: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final String logoPath =
        isDarkMode ? 'assets/logo_white.png' : 'assets/logo_dark.png';

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Registrar-se',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  labelText: 'E-mail',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um e-mail.';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Por favor, insira um e-mail válido.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Senha',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma senha.';
                    } else if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirmar Senha',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, confirme sua senha.';
                    } else if (value != _passwordController.text) {
                      return 'As senhas não coincidem.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _birthDateController,
                  labelText: 'Data de Nascimento',
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _birthDateController.text =
                            pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                  suffixIcon: Icon(Icons.calendar_today),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua data de nascimento.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomCheckboxWithText(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                  text: 'Concordo com os termos e condições.',
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'REGISTRAR',
                  onPressed: _register,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
