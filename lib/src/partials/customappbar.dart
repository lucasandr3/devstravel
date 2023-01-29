import 'package:flutter/material.dart';

CustomAppBar({
  required GlobalKey<ScaffoldState> scaffoldKey,
  required BuildContext screenContext,
  String title = '',
  bool hideSearch = false,
  bool showBack = false,
}) {

  void searchAction() {
      Navigator.pushReplacementNamed(screenContext, '/search');
  }

  IconButton drawerIcon = IconButton(
    onPressed: () {
      scaffoldKey.currentState?.openDrawer();
    },
    icon: Icon(Icons.menu, color: Colors.white, size: 30),
  );

  IconButton backIcon = IconButton(
    onPressed: () {
      Navigator.pop(screenContext);
    },
    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
  );

  IconButton leadingButton = drawerIcon;

  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    backgroundColor: Color(0xFF1e88e5),
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),
    leading: leadingButton,
    actions: [
      !hideSearch
          ? IconButton(
              onPressed: searchAction,
              icon: Icon(Icons.search, color: Colors.white, size: 30))
          : Container()
    ],
  );
}
