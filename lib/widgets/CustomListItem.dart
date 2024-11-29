import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final Widget leading; // Ícono o Avatar
  final String title; // Título principal
  final String subtitle; // Subtítulo
  final Widget? trailing; // Elemento adicional al final
  final VoidCallback onTap; // Acción al presionar el elemento
  final Color backgroundColor; // Color del fondo de la tarjeta

  const CustomListItem({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.onTap,
    this.backgroundColor = Colors.white, // Color predeterminado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: backgroundColor,
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}