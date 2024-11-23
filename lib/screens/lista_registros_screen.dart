import 'package:flutter/material.dart';

class ListaRegistrosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> listaRegistros = [
    {'id': 1, 'titulo': 'Registro 1'},
    {'id': 2, 'titulo': 'Registro 2'},
    {'id': 3, 'titulo': 'Registro 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Registros'),
      ),
      body: ListView.builder(
        itemCount: listaRegistros.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listaRegistros[index]['titulo']),
            subtitle: Text('ID: ${listaRegistros[index]['id']}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalle',
                arguments: listaRegistros[index],
              );
            },
          );
        },
      ),
    );
  }
}
