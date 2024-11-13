import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login(String email, String password) async {
    // Simula a autenticação
    await Future.delayed(Duration(seconds: 2));
    if (email == 'user@example.com' && password == 'password123') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('isLoggedIn', 'token');
      return true;
    } else {
      throw Exception('Falha na autenticação: credenciais inválidas');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('isLoggedIn')?.isNotEmpty ?? false;
  }

  Future<bool> register(String email, String password, String birthDate) async {
    // Simula o processo de registro (substitua por uma chamada de API real)
    await Future.delayed(Duration(seconds: 2));
    if (email.isNotEmpty && password.isNotEmpty && birthDate.isNotEmpty) {
      //TODO: unimplemented logic
      return true;
    } else {
      throw Exception('Erro no registro. Verifique os dados.');
    }
  }
}
