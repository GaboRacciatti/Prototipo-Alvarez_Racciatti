import 'package:flutter/material.dart';
import 'dart:convert';
import 'screens.dart';
import '/widgets/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ListaAreasScreen extends StatefulWidget {
  @override
  _ListaAreasScreenState createState() => _ListaAreasScreenState();
}

class _ListaAreasScreenState extends State<ListaAreasScreen> {
  List<Map<String, dynamic>> areas = [];

  @override
  void initState() {
    super.initState();
    obtenerAreas();
  }

  Future<void> obtenerAreas() async {
  try {
    final apiUrl = dotenv.env['URL_API_ALVAREZ'];
    if (apiUrl == null) {
      throw Exception('La URL de la API no se encontró en las variables de entorno.');
    }

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if(data['data'] != null){
        setState(() {
          areas = (data['data'] as List).map((area) {
            return {
              'id': area['id'] ?? 'N/A',
              'name': area['name'] ?? 'Nombre no disponible',
              'cantEmpleadosArea': area['cantEmpleadosArea'] ?? 0,
              'icono': Icons.business,
            };
          }).toList();
        });
      } else {
        print('La respuesta de la API no contiene datos en el campo "data"');
      }
    } else {
      print('Error en la API. Código de estado: ${response.statusCode}');
      throw Exception('Error en la API. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al obtener los datos: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al cargar las áreas: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Áreas'),
        backgroundColor: Colors.blueGrey,
      ),
      body: areas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: areas.length,
              itemBuilder: (context, index) {
                final area = areas[index];
                return CustomListItem(
                  leading: Icon(area['icono'], color: Colors.blueGrey),
                  title: area['name'],
                  subtitle: 'Empleados: ${area['cantEmpleadosArea']}',
                  trailing: Text(
                    'ID: ${area['id']}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey[800] ?? Colors.blueGrey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleAreaScreen(area: area),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
