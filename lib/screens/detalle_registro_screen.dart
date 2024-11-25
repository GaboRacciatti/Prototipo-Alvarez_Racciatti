import 'package:flutter/material.dart';

class DetalleRegistroScreen extends StatefulWidget {
  final Map<String, dynamic> registro;

  const DetalleRegistroScreen({Key? key, required this.registro}) : super(key: key);

  @override
  _DetalleRegistroScreenState createState() => _DetalleRegistroScreenState();
}

class _DetalleRegistroScreenState extends State<DetalleRegistroScreen> {
  final TextEditingController _comentarioController = TextEditingController();
  bool _enActividad = false;

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
                backgroundImage: NetworkImage(widget.registro['avatar']),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nombre: ${widget.registro['nombre']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Puesto: ${widget.registro['puesto']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Sexo: ${widget.registro['sexo']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Comentario sobre su desempeño:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _comentarioController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Escribe un comentario sobre su desempeño...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '¿Está en actividad?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: _enActividad,
                  onChanged: (bool? value) {
                    if (mounted) {
                      setState(() {
                        _enActividad = value ?? false;
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (mounted) {
                  print('Comentario: ${_comentarioController.text}');
                  print('Está en actividad: $_enActividad');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Información guardada'),
                      duration: Duration(seconds: 2), 
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: Text('Guardar Información'),
            ),
          ],
        ),
      ),
    );
  }
}
