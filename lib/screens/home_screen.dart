import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menú')),
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/perfil');
              },
            ),
            ListTile(
              title: Text('Lista de registros'),
              onTap: () {
                Navigator.pushNamed(context, '/listado');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenido a la Home Screen'),
      ),
    );
  }
}
