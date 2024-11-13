import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recover_password_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/email_validator_text_field.dart';

class RecoverPasswordScreen extends StatefulWidget {
  @override
  _RecoverPasswordScreenState createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecoverPasswordProvider(),
      child: Consumer<RecoverPasswordProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Recupere sua senha:',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 16),
                    EmailValidatorTextField(
                      controller: _emailController,
                      labelText: 'E-mail',
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'RECUPERAR',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          provider.sendRecoveryEmail(
                              context, _emailController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
