import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox_with_text.dart';
import '../widgets/email_validator_text_field.dart';
import '../widgets/password_field_with_visibility_toggle.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Verifica se o tema atual é escuro
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final String logoPath = isDarkMode ? 'assets/logo_light.png' : 'assets/logo_dark.png';

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 48.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            logoPath, // Usa o caminho do ícone com base no tema
                            height: 200,
                          ),
                        ),
                        SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Faça seu login:',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Use seu e-mail e senha para acessar.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).hintColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        EmailValidatorTextField(
                          controller: _emailController,
                          labelText: 'E-mail',
                        ),
                        SizedBox(height: 20),
                        PasswordFieldWithVisibilityToggle(
                          controller: _passwordController,
                          labelText: 'Senha',
                        ),
                        SizedBox(height: 10),
                        CustomCheckboxWithText(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          text: 'Lembrar senha.',
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: 'ENTRAR',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await Provider.of<AuthProvider>(context,
                                    listen: false)
                                    .login(_emailController.text,
                                    _passwordController.text);
                                Navigator.pushReplacementNamed(
                                    context, '/profile');
                              } catch (e) {
                                _showSnackBar(
                                    'Falha no login: ${e.toString()}');
                              }
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text('REGISTRAR',
                                style: TextStyle(color: Theme.of(context).primaryColor)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
