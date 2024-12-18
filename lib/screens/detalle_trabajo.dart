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
        title: Text(
          'Detalle del Trabajo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              
              _buildSectionTitle('Descripción del Trabajo'),
              _buildInfoBox(widget.trabajo['descripcion_trabajo'] ?? 'No especificado'),

              SizedBox(height: 16),
              _buildSectionTitle('Empleado a cargo'),
              _buildInfoBox(widget.trabajo['nombre_empleado'] ?? 'No especificado'),

              SizedBox(height: 16),
              _buildSectionTitle('Puesto'),
              _buildInfoBox(widget.trabajo['puesto'] ?? 'No especificado'),

              SizedBox(height: 16),
              _buildSectionTitle('Comentario'),
              TextFormField(
                controller: _comentarioController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Escribe un comentario sobre este trabajo...',
                  hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.grey[100], 
                  filled: true,
                ),
                style: TextStyle(fontSize: 16, color: Colors.blueGrey[900]),
              ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¿Trabajo completado?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  Switch(
                    value: _trabajoCompletado,
                    onChanged: (bool value) {
                      setState(() {
                        _trabajoCompletado = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.grey[400],
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),

              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    
                    print('Comentario: ${_comentarioController.text}');
                    print('Trabajo completado: $_trabajoCompletado');

                   
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Información del trabajo guardada',
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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


  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[800],
      ),
    );
  }

  
  Widget _buildInfoBox(String text) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blueGrey[300]!),
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
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
