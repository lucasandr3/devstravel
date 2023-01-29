import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/processcard.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var list = [

  ];

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(
                scaffoldKey: _scaffoldKey,
                screenContext: ctx,
                title: "Busca de Processos",
                hideSearch: true),
            drawer: CustomDrawer(
              screenContext: ctx,
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Digite alguma informação do processo',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
                Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(list.length, (index) => ProcessCard(
                          data: list[index],
                          onTap: () {}
                      )),
                    )
                ),
              ],
            )));
  }
}
