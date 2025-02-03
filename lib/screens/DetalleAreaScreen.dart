import 'package:flutter/material.dart';

class DetalleAreaScreen extends StatefulWidget {
  final Map<String, dynamic> area;

  const DetalleAreaScreen({Key? key, required this.area}) : super(key: key);

  @override
  _DetalleAreaScreenState createState() => _DetalleAreaScreenState();
}

class _DetalleAreaScreenState extends State<DetalleAreaScreen> {
  final TextEditingController _comentarioController = TextEditingController();
  bool _areaActiva = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final boxBorderColor = isDarkMode ? Colors.white70 : Colors.blueGrey[300]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del Área',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Nombre del Área', textColor),
              _buildInfoBox(widget.area['name'] ?? 'No especificado', backgroundColor, boxBorderColor, textColor),

              SizedBox(height: 16),
              _buildSectionTitle('Cantidad de Empleados', textColor),
              _buildInfoBox(widget.area['cantEmpleadosArea'].toString(), backgroundColor, boxBorderColor, textColor),

              SizedBox(height: 16),
              _buildSectionTitle('ID del Área', textColor),
              _buildInfoBox(widget.area['id'], backgroundColor, boxBorderColor, textColor),

              SizedBox(height: 16),
              _buildSectionTitle('Comentario', textColor),
              TextFormField(
                controller: _comentarioController,
                maxLines: 3,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: 'Escribe un comentario sobre esta área...',
                  hintStyle: TextStyle(color: textColor.withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: backgroundColor,
                  filled: true,
                ),
              ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¿Área activa?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  Switch(
                    value: _areaActiva,
                    onChanged: (value) {
                      setState(() {
                        _areaActiva = value;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),

              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Comentario: ${_comentarioController.text}');
                    print('Área activa: $_areaActiva');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Información del área guardada'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Guardar Información',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color textColor) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  Widget _buildInfoBox(String text, Color backgroundColor, Color borderColor, Color textColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
