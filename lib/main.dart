import 'package:flutter/material.dart';
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
  bool isDarkTheme = false; 

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
        '/perfil': (context) => PerfilScreen(
              toggleTheme: toggleTheme,
              isDarkTheme: isDarkTheme,
              registro: {
                'nombre': 'Juan Pérez',
                'email': 'juan.perez@empresa.com',
                'ubicacion': 'Buenos Aires, Argentina',
                'avatar': 'https://ui-avatars.com/api/?name=Juan+Pérez&background=random',
      },
            ),
        '/listado': (context) => ListaRegistroScreen(),
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
