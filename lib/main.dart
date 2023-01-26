import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/models/appdata.dart';

import 'src/screens/search.dart';
import 'src/screens/home.dart';
import 'src/screens/preload.dart';

void main() => runApp(
  MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => AppData())
      ],
      child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/preload': (context) => PreloadScreen(),
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
      },
      initialRoute: '/preload',
    );
  }
}
