import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  final VoidCallback toggleTheme; // Función para cambiar el tema
  final bool isDarkTheme; // Estado del tema actual

  PerfilScreen({required this.toggleTheme, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usuario: Juan Pérez',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tema Oscuro'),
                Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    toggleTheme(); // Cambia el tema
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
