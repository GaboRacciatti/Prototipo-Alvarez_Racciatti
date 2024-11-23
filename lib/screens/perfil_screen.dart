import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkTheme; 

  final Map<String, dynamic> registro;

  PerfilScreen({required this.toggleTheme, required this.isDarkTheme, required this.registro});

  String generarAvatar(String nombre) {
    return 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(nombre)}&background=random';
  }

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

            ElevatedButton.icon(
              onPressed: () {
                // Mostrar un SnackBar simulando la edición del perfil
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Perfil editado'),
                    duration: Duration(seconds: 2), // Duración del SnackBar
                    behavior: SnackBarBehavior.floating, // Opcional: estilo flotante
                  ),
                );
              },
              icon: Icon(Icons.edit),
              label: Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Color del texto y el ícono
                backgroundColor: Color(0xFF6200EA), // Violeta oscuro
                minimumSize: Size(double.infinity, 40), // Tamaño mínimo
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
