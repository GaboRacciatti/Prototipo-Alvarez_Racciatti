import 'package:flutter/material.dart';

class DetalleRegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> registro =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: registro['titulo'],
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 20),
            Text('ID: ${registro['id']}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Guardar cambios
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
