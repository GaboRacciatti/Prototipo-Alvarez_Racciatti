import 'package:flutter/material.dart';

class DetalleRegistroScreen extends StatelessWidget {
  final Map<String, dynamic> registro;

  const DetalleRegistroScreen({Key? key, required this.registro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Empleado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(registro['avatar']),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nombre: ${registro['nombre']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Puesto: ${registro['puesto']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Sexo: ${registro['sexo']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
