import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticktag_mobile/widgets/custom_app_bar.dart';

import '../providers/new_password_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/password_field_with_visibility_toggle.dart';

class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewPasswordProvider(),
      child: Consumer<NewPasswordProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: provider.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Nova senha:',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    SizedBox(height: 16),
                    PasswordFieldWithVisibilityToggle(
                      controller: provider.newPasswordController,
                      labelText: 'Nova senha',
                      validator: provider.validatePassword,
                    ),
                    SizedBox(height: 20),
                    PasswordFieldWithVisibilityToggle(
                      controller: provider.repeatPasswordController,
                      labelText: 'Repetir nova senha',
                      validator: provider.validateRepeatPassword,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'SALVAR',
                      onPressed: () => provider.saveNewPassword(context),
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
