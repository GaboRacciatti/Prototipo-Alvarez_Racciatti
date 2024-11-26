import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('G.A. DEVELOPS'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.business,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menú',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Perfil de usuario'),
              onTap: () {
                Navigator.pushNamed(context, '/perfil');
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista de Empleados (Racciatti)'),
              onTap: () {
                Navigator.pushNamed(context, '/listado');
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in), // Ícono representativo
              title: Text('Trabajos Realizados'), // Nueva opción en el menú
              onTap: () {
                Navigator.pushNamed(context, '/trabajos_realizados'); // Navega a la pantalla de Trabajos Realizados
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              isDarkTheme ? 'lib/assets/2.png' : 'lib/assets/1.png',
              height: 350,
            ),
            SizedBox(height: 20),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                'G.A. SOFTWARE DEVELOPERS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Bienvenido al sistema de gestión de nuestra empresa. '
                'Aquí podrás consultar el listado de empleados, trabajos realizados y más.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
