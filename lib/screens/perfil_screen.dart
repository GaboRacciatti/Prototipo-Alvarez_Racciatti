import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/api_service.dart';
import '../models/perfil.dart';
import '../providers/themeProviders.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  late Future<Perfil> _perfil;

  @override
  void initState() {
    super.initState();
    _perfil = ApiService.obtenerPerfil();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: FutureBuilder<Perfil>(
        future: _perfil,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar el perfil"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("No se encontró el perfil"));
          }

          final perfil = snapshot.data!;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(perfil.avatar),
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  '¡Hola de nuevo ${perfil.nombre} ${perfil.apellido}!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                
                Text(
                  'Email: ${perfil.email}',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),

                Text(
                  'Ubicación: ${perfil.ubicacion}', 
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tema Oscuro', style: TextStyle(fontSize: 18)),
                    Switch(
                      value: themeProvider.isDarkTheme,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _perfil = ApiService.obtenerPerfil();
                    });
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Actualizar Perfil'),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
