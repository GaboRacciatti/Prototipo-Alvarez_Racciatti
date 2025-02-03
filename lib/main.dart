import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'helpers/preferences.dart';
import 'providers/themeProviders.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Preferences.initShared();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(Preferences.darkmode),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/perfil': (context) => PerfilScreen(),
        '/listado': (context) => ListaRegistroScreen(),
        '/areas': (context) => ListaAreasScreen(),
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
