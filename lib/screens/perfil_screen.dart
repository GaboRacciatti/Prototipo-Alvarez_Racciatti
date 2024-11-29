import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PerfilScreen extends StatelessWidget {
  final VoidCallback toggleTheme; // Callback para cambiar el tema
  final bool isDarkTheme; // Estado del tema actual
  final Map<String, dynamic> registro; // Información del perfil

  PerfilScreen({
    required this.toggleTheme,
    required this.isDarkTheme,
    required this.registro,
  });

  // Generar un avatar dinámico a partir del nombre
  String generarAvatar(String nombre) {
    return 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(nombre)}&background=random';
  }

  // Guardar el perfil actualizado en SharedPreferences
  Future<void> guardarPerfil(Map<String, dynamic> perfil) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('perfil', jsonEncode(perfil)); // Guardar como JSON
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController(text: registro['nombre']);
    TextEditingController emailController = TextEditingController(text: registro['email']);
    TextEditingController ubicacionController = TextEditingController(text: registro['ubicacion']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(generarAvatar(registro['nombre'])),
              ),
            ),
            SizedBox(height: 20),

            Text(
              '¡Hola de nuevo! ${registro['nombre']}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              'Email: ${registro['email'] ?? 'No disponible'}',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),

            Text(
              'Ubicación: ${registro['ubicacion'] ?? 'No disponible'}',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tema Oscuro', style: TextStyle(fontSize: 18)),
                Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    toggleTheme();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Botón para editar el perfil
            ElevatedButton.icon(
              onPressed: () async {
                final nuevoPerfil = {
                  'nombre': nombreController.text,
                  'email': emailController.text,
                  'ubicacion': ubicacionController.text,
                  'avatar': registro['avatar'],
                };
                await guardarPerfil(nuevoPerfil);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Perfil editado'),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: Icon(Icons.edit),
              label: Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF6200EA),
                minimumSize: Size(double.infinity, 40),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
