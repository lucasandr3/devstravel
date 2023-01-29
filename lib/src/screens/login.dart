import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/appdata.dart';

void enviaPost(BuildContext ctx, String email, String senha) async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final response = await http.post(Uri.parse("http://onlicitacao.test/api/auth/login"),
    body: {
      'email': email,
      'password': senha
    }
  );

  if (response.statusCode == 201) {
    var token = jsonDecode(response.body)['token'];
    await sharedPreferences.setString('token', token);
    Navigator.pushReplacementNamed(ctx, '/home');
  } else {
    const snackbar = SnackBar(
        content: Text('Credenciais Inválidas.', textAlign: TextAlign.center),
        backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String email = '';
  String senha = '';

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldKey,
            backgroundColor: Color(0xFFeef5f9),
            body: SafeArea(
                child: Center(
                    child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/assets/logo_azul.png", width: 100),
                  SizedBox(height: 25),
                  Text("Onlicitação",
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: 30,
                          letterSpacing: 1.5,
                          color: Colors.black54)),
                  SizedBox(height: 10),
                  Text("entre com suas credenciais",
                      style: GoogleFonts.abel(
                          fontSize: 17,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w100,
                          color: Colors.black54)),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Digite seu e-mail',
                          ),
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Digite seu e-mail';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: TextFormField(
                          controller: _senhaController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Digite sua senha'),
                          validator: (senha) {
                            if (senha == null || senha.isEmpty) {
                              return 'Digite sua senha';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              senha = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.blue,
                                textStyle: GoogleFonts.abyssinicaSil(
                                  fontSize: 18,
                                ),
                                padding: const EdgeInsets.all(20)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.save();
                                  enviaPost(context, email, senha);
                              }
                            },
                            child: Text('Entrar'),
                          )),
                    ),
                  ),
                ],
              ),
            )))));
  }
}
