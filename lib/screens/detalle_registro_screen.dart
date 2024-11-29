import 'package:flutter/material.dart';

class DetalleRegistroScreen extends StatefulWidget {
  final Map<String, dynamic> registro;

  const DetalleRegistroScreen({Key? key, required this.registro})
      : super(key: key);

  @override
  _DetalleRegistroScreenState createState() => _DetalleRegistroScreenState();
}

class _DetalleRegistroScreenState extends State<DetalleRegistroScreen> {
  final TextEditingController _comentarioController = TextEditingController();
  bool _enActividad = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.grey[200];
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final placeholderColor = isDarkMode ? Colors.grey[600] : Colors.grey[400];

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Empleado'),
      ),
      body: Container(
        color: backgroundColor,
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
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            SizedBox(height: 8),
            Text(
              'Puesto: ${widget.registro['puesto']}',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            SizedBox(height: 8),
            Text(
              'Sexo: ${widget.registro['sexo']}',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            SizedBox(height: 16),
            Text(
              'Comentario sobre su desempeño:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
            ),
            TextFormField(
              controller: _comentarioController,
              maxLines: 4,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: 'Escribe un comentario sobre su desempeño...',
                hintStyle: TextStyle(color: placeholderColor), 
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: textColor.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: textColor.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '¿Está en actividad?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
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
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
