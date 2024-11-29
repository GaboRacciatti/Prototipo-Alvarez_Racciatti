import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Para manejar JSON
import 'screens/screens.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false; // Control del tema actual
  Map<String, dynamic> registro = {}; // Perfil del usuario

  @override
  void initState() {
    super.initState();
    cargarPerfil(); // Cargar perfil al iniciar la app
  }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  // Guardar el perfil en Shared Preferences
  Future<void> guardarPerfil(Map<String, dynamic> perfil) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('perfil', jsonEncode(perfil)); // Convertir a JSON
    setState(() {
      registro = perfil;
    });
  }

  // Cargar el perfil desde Shared Preferences
  Future<void> cargarPerfil() async {
    final prefs = await SharedPreferences.getInstance();
    final perfilJson = prefs.getString('perfil');
    if (perfilJson != null) {
      setState(() {
        registro = jsonDecode(perfilJson); // Convertir de JSON a Map
      });
    } else {
      // Perfil predeterminado si no existe en Shared Preferences
      registro = {
        'nombre': 'Juan Pérez',
        'email': 'juan.perez@empresa.com',
        'ubicacion': 'Buenos Aires, Argentina',
        'avatar': 'https://ui-avatars.com/api/?name=Juan+Pérez&background=random',
      };
      guardarPerfil(registro); // Guardar el perfil inicial
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/perfil': (context) => PerfilScreen(
              toggleTheme: toggleTheme,
              isDarkTheme: isDarkTheme,
              registro: registro,
            ),
        '/listado': (context) => ListaRegistroScreen(),
        '/trabajos_realizados': (context) => ListaTrabajosScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detalle') {
          final registro = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DetalleRegistroScreen(registro: registro),
          );
        }
        return null;
      },
    );
  }
}
