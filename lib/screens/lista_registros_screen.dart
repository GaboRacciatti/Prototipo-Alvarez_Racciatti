import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'detalle_registro_screen.dart';
import 'dart:convert';
import '/widgets/widgets.dart';

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
    final apiUrl = dotenv.env['URL_API_GABO'];
    if (apiUrl == null) {
      throw Exception('La url no se encontró');
    }

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['data'] != null) {
        setState(() {
          registros = (data['data'] as List).map((registro) {
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
        print('Error: El campo "data" no está presente en la respuesta.');
      }
    } else {
      print('Error en la API: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al obtener los datos: $e');
  }
}


  String generarAvatar(String nombre) {
    return 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(nombre)}&background=random';
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
                return CustomListItem(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(registro['avatar']),
                  ),
                  title: registro['nombre'],
                  subtitle: registro['puesto'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetalleRegistroScreen(registro: registro),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
