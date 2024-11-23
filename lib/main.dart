import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/perfil_screen.dart';
import 'screens/lista_registros_screen.dart';
import 'screens/detalle_registro_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false; // Tema inicial

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
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
        '/perfil': (context) => PerfilScreen(toggleTheme: toggleTheme, isDarkTheme: isDarkTheme),
        '/listado': (context) => ListaRegistrosScreen(),
        '/detalle': (context) => DetalleRegistroScreen(),
      },
    );
  }
}
