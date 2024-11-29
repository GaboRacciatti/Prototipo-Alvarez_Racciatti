import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final Widget leading;
  final String title; 
  final String subtitle; 
  final Widget? trailing; 
  final VoidCallback onTap; 
  final Color backgroundColor; 

  const CustomListItem({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.onTap,
    this.backgroundColor = Colors.white,
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