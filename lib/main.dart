import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';
import 'screens/new_password_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/recover_password_screen.dart';
import 'screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authProvider = AuthProvider();
  await authProvider.checkLoginStatus();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => authProvider),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return MaterialApp(
          title: 'TickTag',
          theme: _lightTheme(), // Tema comum
          darkTheme: _darkTheme(), // Tema black mode
          themeMode: ThemeMode.system, // Usa o tema do sistema ou pode ser ThemeMode.light/dark
          initialRoute: authProvider.isAuthenticated ? '/' : '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/profile': (context) => ProfileScreen(),
            '/recover_password': (context) => RecoverPasswordScreen(),
            '/new_password': (context) => NewPasswordScreen(),
          },
        );
      },
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.teal[50],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.dark,
      primaryColor: Colors.grey,
      scaffoldBackgroundColor: Colors.black87,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }
}
