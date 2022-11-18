import 'package:flutter/foundation.dart';
/*import 'package:http/http.dart' as http;
import 'dart:convert';*/

class LoginController with ChangeNotifier {
  bool obscurePassword = true;

  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  /// El http post es un Future entonces hacemos que la función sea un future para poder hacer un login().then()
  /// en la interfaz
  /// Regresamos un bool para indicar si se hizo el login de manera exitosa o no
  Future<bool> login() async {
    return true;
    /*http.post(
      Uri.parse("url de login"),
      headers: <String, String> {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer mt0dgHmLJMVQhvjpNXDyA83vA_PxH23Y"
      },
      body: json.encode({
        "username": "",
        "password": "",
      })
    ).then((response) {
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
      }
    });*/
  }
}
