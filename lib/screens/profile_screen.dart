import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticktag_mobile/widgets/custom_app_bar.dart';

import '../providers/profile_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/email_validator_text_field.dart';
import '../widgets/password_field_with_visibility_toggle.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '<Usuário>',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '<usuário.cidade>',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: provider.nameController,
                      labelText: 'Nome completo',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu nome completo.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    EmailValidatorTextField(
                      controller: provider.emailController,
                      labelText: 'E-mail',
                    ),
                    SizedBox(height: 16),
                    PasswordFieldWithVisibilityToggle(
                      controller: provider.currentPasswordController,
                      labelText: 'Senha atual',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha atual.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    PasswordFieldWithVisibilityToggle(
                      controller: provider.newPasswordController,
                      labelText: 'Nova senha',
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 6) {
                          return 'A nova senha deve ter pelo menos 6 caracteres.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'SALVAR',
                      onPressed: () => provider.saveProfile(context),
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
