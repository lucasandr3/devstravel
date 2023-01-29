import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/appdata.dart';

class PreloadScreen extends StatefulWidget {
  @override
  _PreloadScreen createState() => _PreloadScreen();
}

class _PreloadScreen extends State<PreloadScreen> {
  bool loading = true;

  void checkToken() async {

    setState(() {
      loading = true;
    });

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('token') != null) {

      setState(() {
        loading = false;
      });

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading = false;
      });

      Navigator.pushReplacementNamed(context, '/login');
    }

  }


  // void requestInfo() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //
  //   setState(() {
  //     loading = true;
  //   });
  //
  //   bool req = await Provider.of<AppData>(context, listen: false).requestData();
  //
  //   if (req) {
  //     Navigator.pushReplacementNamed(context, '/home');
  //   } else {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

  void initState() {
    super.initState();
    // requestInfo();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/logo.png", width: 200),

            loading ? Container(
              margin: EdgeInsets.all(30),
              child: Text("Buscando Informações...",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1
                ),
              ),
            ) : Container(),

            loading ? CircularProgressIndicator(
              strokeWidth: 3,
            ): Container(),

            !loading ? Container(
              margin: EdgeInsets.all(30),
              child: TextButton(
                child: Text("Tentar Novamente"),
                onPressed: checkToken,
              ),
            ): Container(),

          ],
        ),
      ),
    );
  }
}