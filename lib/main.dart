import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'helpers/preferences.dart';
import 'service/ServicePerfil.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Preferences.initShared();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = Preferences.darkmode;
  Map<String, dynamic> registro = {};

  @override
  void initState() {
    super.initState();
    inicializarPerfil();
  }

  void inicializarPerfil() async {
    final perfil = await ServicePerfil.cargarPerfil();
    setState(() {
      registro = perfil;
    });
  }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
      Preferences.darkmode = isDarkTheme;
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
