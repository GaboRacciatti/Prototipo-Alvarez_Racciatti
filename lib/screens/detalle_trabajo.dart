import 'package:flutter/material.dart';

class DetalleTrabajoScreen extends StatefulWidget {
  final Map<String, dynamic> trabajo;

  const DetalleTrabajoScreen({Key? key, required this.trabajo}) : super(key: key);

  @override
  _DetalleTrabajoScreenState createState() => _DetalleTrabajoScreenState();
}

class _DetalleTrabajoScreenState extends State<DetalleTrabajoScreen> {
  final TextEditingController _comentarioController = TextEditingController();
  bool _trabajoCompletado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Trabajo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostrar datos básicos del trabajo
            Text(
              'Descripción del Trabajo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.trabajo['descripcion_trabajo'] ?? 'No especificado',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Empleado a cargo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.trabajo['nombre_empleado'] ?? 'No especificado',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Puesto:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.trabajo['puesto'] ?? 'No especificado',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Input para comentarios
            Text(
              'Comentario:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _comentarioController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Escribe un comentario sobre este trabajo...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Switch para trabajo completado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '¿Trabajo completado?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _trabajoCompletado,
                  onChanged: (bool value) {
                    setState(() {
                      _trabajoCompletado = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 16),
            // Botón para guardar la información
            ElevatedButton(
              onPressed: () {
                // Imprimir comentario y estado del trabajo
                print('Comentario: ${_comentarioController.text}');
                print('Trabajo completado: $_trabajoCompletado');

                // Mostrar una alerta (SnackBar) indicando que la información fue guardada
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Información del trabajo guardada'),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Text('Guardar Información'),
            ),
          ],
        ),
      ),
    );
  }
}
