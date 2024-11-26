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
        Uri.parse('https://66d9de7f4ad2f6b8ed564dbf.mockapi.io/Trabajos_Realizados'), //En este link manejamos registros de la API
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
              'icono': generarIcono(), 
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

  Icon generarIcono() {
    return Icon(Icons.assignment_turned_in, color: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Trabajos Realizados'),
      ),
      body: trabajos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: trabajos.length,
              itemBuilder: (context, index) {
                final trabajo = trabajos[index];
                return ListTile(
                  leading: trabajo['icono'],
                  title: Text(trabajo['descripcion_trabajo']),
                  subtitle: Text('Empleado: ${trabajo['nombre_empleado']}'),
                  trailing: Text(trabajo['puesto']),
                  onTap: () {
                    // Cambiado: Navega a la pantalla de detalles del trabajo
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleTrabajoScreen(
                          trabajo: trabajo,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
