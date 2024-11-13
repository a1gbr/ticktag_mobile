import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Verifica se o tema atual é dark mode para escolher a logo correta
    const String logoPath = 'assets/logo_light.png';

    return AppBar(
      title: Image.asset(
        logoPath, // Exibe a logo correta de acordo com o tema
        height: 40,
      ),
      backgroundColor: Colors.teal,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
