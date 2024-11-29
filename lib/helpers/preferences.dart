import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static bool _darkmode = false;
  static String _apellido = 'Perez';
  static String _nombre = 'Juan';
  static String _email = 'JuanPerez@gmail.com';
  static String _ubicacion = 'Bahia Blanca';
  static late SharedPreferences _prefs;

  static Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get darkmode {
    return _prefs.getBool('darkmode') ?? _darkmode;
  }

  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }

  static set apellido(String value) {
    _apellido = value;
    _prefs.setString('apellido', value);
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  static set email(String value) {
    _email = value;
    _prefs.setString('email', value);
  }

  static set ubicacion(String value) {
    _ubicacion = value;
    _prefs.setString('ubicacion', value);
  }

  static String get apellido {
    return _prefs.getString('apellido') ?? _apellido;
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static String get ubicacion {
    return _prefs.getString('ubicacion') ?? _ubicacion;
  }
}
