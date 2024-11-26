import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detalle_registro_screen.dart';
import 'dart:convert';

class ListaRegistroScreen extends StatefulWidget {
  @override
  _ListaRegistroScreenState createState() => _ListaRegistroScreenState();
}

class _ListaRegistroScreenState extends State<ListaRegistroScreen> {
  List<dynamic> registros = [];

  @override
  void initState() {
    super.initState();
    obtenerRegistros();
  }

  Future<void> obtenerRegistros() async {
    try {
      final response = await http.get(
        Uri.parse('https://66f2ca6e71c84d805876bcdb.mockapi.io/api/v1/Empleado'), //En este link manejamos registros de la API
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          registros = data.map((registro) {
            return {
              'id': registro['id'],
              'nombre': registro['nombre'],
              'puesto': registro['puesto'],
              'sexo': registro['sexo'],
              'avatar': generarAvatar(registro['nombre']),
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

  String generarAvatar(String nombre) {
    return 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(nombre)}&background=random'; //generamos un avatar aleatorio para cada empleado usando la API de UI Avatars
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Empleados'),
      ),
      body: registros.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: registros.length,
              itemBuilder: (context, index) {
                final registro = registros[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(registro['avatar']),
                  ),
                  title: Text(registro['nombre']),
                  subtitle: Text(registro['puesto']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleRegistroScreen(registro: registro),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
