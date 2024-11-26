import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'screens.dart';

class ListaTrabajosScreen extends StatefulWidget {
  @override
  _ListaTrabajosScreenState createState() => _ListaTrabajosScreenState();
}

class _ListaTrabajosScreenState extends State<ListaTrabajosScreen> {
  List<dynamic> trabajos = [];

  @override
  void initState() {
    super.initState();
    obtenerTrabajos();
  }

  Future<void> obtenerTrabajos() async {
    try {
      final response = await http.get(
        Uri.parse('https://66d9de7f4ad2f6b8ed564dbf.mockapi.io/Trabajos_Realizados'), // Link de la API
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          trabajos = data.map((trabajo) {
            return {
              'id_trabajo': trabajo['id_trabajo'],
              'nombre_empleado': trabajo['nombre_empleado'],
              'descripcion_trabajo': trabajo['descripcion_trabajo'],
              'puesto': trabajo['puesto'],
              'icono': generarIcono(trabajo['puesto']), // Ícono dinámico según el puesto
            };
          }).toList();
        });
      } else {
        print('Error en la API: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener los datos: $e');
    }
  }

  Icon generarIcono(String puesto) {
    switch (puesto.toLowerCase()) {
      case 'engineer':
        return Icon(Icons.engineering, color: Colors.blue);
      case 'agent':
        return Icon(Icons.support_agent, color: Colors.orange);
      case 'executive':
        return Icon(Icons.business, color: Colors.purple);
      case 'assistant':
        return Icon(Icons.assistant, color: Colors.green);
      default:
        return Icon(Icons.work, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Trabajos Realizados'),
        backgroundColor: Colors.blueGrey,
      ),
      body: trabajos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: trabajos.length,
              itemBuilder: (context, index) {
                final trabajo = trabajos[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[100],
                      child: trabajo['icono'],
                    ),
                    title: Text(
                      trabajo['descripcion_trabajo'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text(
                      'Empleado: ${trabajo['nombre_empleado']}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        trabajo['puesto'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navegar a la pantalla de detalles del trabajo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleTrabajoScreen(
                            trabajo: trabajo,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
