import 'package:prototipo_racciatti_alvarez/helpers/preferences.dart';

class ServicePerfil {
  static Future<Map<String, dynamic>> cargarPerfil() async {

    return {
      'nombre': Preferences.nombre,
      'apellido': Preferences.apellido,
      'email': Preferences.email,
      'ubicacion': Preferences.ubicacion,
      'avatar': generarAvatar(Preferences.nombre),
    };
  }

  static String generarAvatar(String nombre) {
    return 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(nombre)}&background=random';
  }
}
