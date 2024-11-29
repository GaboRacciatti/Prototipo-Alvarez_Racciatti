import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'screens.dart';
import '/widgets/widgets.dart';

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
        Uri.parse('https://66d9de7f4ad2f6b8ed564dbf.mockapi.io/Trabajos_Realizados'),
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
              'icono': generarIcono(trabajo['puesto']),
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
              itemCount: trabajos.length,
              itemBuilder: (context, index) {
                final trabajo = trabajos[index];
                return CustomListItem( // widget reutilizable por los dos integrantes
                  leading: trabajo['icono'],
                  title: trabajo['descripcion_trabajo'],
                  subtitle: 'Empleado: ${trabajo['nombre_empleado']}',
                  trailing: Text(
                    trabajo['puesto'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetalleTrabajoScreen(trabajo: trabajo),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
