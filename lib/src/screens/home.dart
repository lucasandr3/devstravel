import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            backgroundColor: Color(0xFFeef5f9),
            key: _scaffoldKey,
            appBar: CustomAppBar(
                scaffoldKey: _scaffoldKey,
                screenContext: ctx,
                title: "Home",
                hideSearch: true),
            drawer: CustomDrawer(
              screenContext: ctx,
            ),
            body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10, left: 10, bottom: 20),
                        child: Row(
                          children: [
                            Text('Bem Vindo,', style: GoogleFonts.abel(
                              letterSpacing: 1.5,
                              fontSize: 17
                            )),
                            Text(' Lucas', style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5
                            )),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                  color: Color(0xFF1e88e5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(Icons.file_copy_outlined, color: Colors.white),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('0', style: GoogleFonts.abyssinicaSil(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                )),
                                SizedBox(width: 15),
                                Text('Processos realizados em 2023', style: GoogleFonts.abel(
                                  fontSize: 16
                                )),
                              ],
                            )
                          ],
                        )
                      ),

                      Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                    color: Color(0xFFffb22b),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Icon(Icons.shopping_cart_checkout, color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('0', style: GoogleFonts.abyssinicaSil(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )),
                                  SizedBox(width: 15),
                                  Text('Processos vencidos em 2023', style: GoogleFonts.abel(
                                      fontSize: 16
                                  )),
                                ],
                              )
                            ],
                          )
                      ),

                      Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                    color: Color(0xFF7460ee),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Icon(Icons.warehouse_sharp, color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('0', style: GoogleFonts.abyssinicaSil(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )),
                                  SizedBox(width: 15),
                                  Text('Total de prefeituras', style: GoogleFonts.abel(
                                      fontSize: 16
                                  )),
                                ],
                              )
                            ],
                          )
                      ),

                      Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                    color: Color(0xFFfc4b6c),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Icon(Icons.account_box, color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('0', style: GoogleFonts.abyssinicaSil(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )),
                                  SizedBox(width: 15),
                                  Text('Total de Fornecedores', style: GoogleFonts.abel(
                                      fontSize: 16
                                  )),
                                ],
                              )
                            ],
                          )
                      ),

                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   margin: EdgeInsets.only(top: 10, bottom: 20),
                      //   child: Column(
                      //     children: [
                      //       Text('5 Itens mais Homologados,', style: GoogleFonts.abel(
                      //           letterSpacing: 1.5,
                      //           fontSize: 17,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black87
                      //       )),
                      //       Text('Itens que mais são vendidos', style: GoogleFonts.abel(
                      //           letterSpacing: 1.5
                      //       )),
                      //     ],
                      //   ),
                      // ),

                    ],
                  ),
                ),
              ),
            ))));
  }
}
