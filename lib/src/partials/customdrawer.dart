import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer CustomDrawer({
  required BuildContext screenContext
}) {

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
    Navigator.pushReplacementNamed(screenContext, '/login');
  }

  return Drawer(
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
              child: Text('L'),
              backgroundColor: Colors.white,
            ),
            accountName: Text('Lucas Vieira'),
            accountEmail: Text('lucasvieiraandrade58@gmail.com')
        ),
        // DrawerHeader(
        //   decoration: BoxDecoration(color: Colors.blue),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text("Onlicitação",
        //           style: GoogleFonts.abel(
        //               fontSize: 30,
        //               fontWeight: FontWeight.bold,
        //               // letterSpacing: 1.5,
        //               color: Colors.white)),
        //       Text('versão 1.0',
        //           style: GoogleFonts.abel(
        //               color: Colors.white,
        //               fontSize: 14)),
        //     ],
        //   ),
        // ),
        ListTile(
          leading: Icon(Icons.home, color: Colors.black87),
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/home');
          },
        ),
        ListTile(
          leading: Icon(Icons.public, color: Colors.black87),
          title: Text('Últimos Processos'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/continents');
          },
        ),
        ListTile(
          leading: Icon(Icons.search, color: Colors.black87),
          title: Text('Buscar Processos'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/search');
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.black87),
          title: const Text('Cidades Salvas'),
          onTap: () {
            Navigator.pushReplacementNamed(screenContext, '/favorites');
          },
        ),
        Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.black87),
                title: const Text('Sair'),
                onTap: logout,
              ),
            )
        )
      ],
    ),
  );
}
