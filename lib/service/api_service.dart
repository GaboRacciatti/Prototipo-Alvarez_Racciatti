import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math'; 
import '../models/perfil.dart';

class ApiService {
  static String _generateRandomId() {
    final random = Random();
    return (random.nextInt(10) + 1).toString(); 
  }

  static Future<Perfil> obtenerPerfil() async {
    String randomId = _generateRandomId();
    String url = 'https://66f2ca6e71c84d805876bcdb.mockapi.io/api/v1/usuario/$randomId';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Perfil.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al cargar el perfil");
    }
  }
}
