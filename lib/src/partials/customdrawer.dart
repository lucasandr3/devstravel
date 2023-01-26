import 'package:flutter/material.dart';

CustomDrawer({
  required BuildContext screenContext
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.all(0),
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Devs Travel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue')),
              Text('versão 1.0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Helvetica Neue'))
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.home, color: Colors.black87),
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/home');
          },
        ),
        ListTile(
          leading: Icon(Icons.public, color: Colors.black87),
          title: Text('Escolher Continente'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/continents');
          },
        ),
        ListTile(
          leading: Icon(Icons.search, color: Colors.black87),
          title: Text('Buscar Cidade'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/search');
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.black87),
          title: Text('Cidades Salvas'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/favorites');
          },
        ),
      ],
    ),
  );
}
