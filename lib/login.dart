import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_crud/signing_page.dart';

class Login extends StatefulWidget {
  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<Login> {
  static String tag = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff1a237e), Color(0xff0277bd)],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'img/logo.png',
                    width: 220.0,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (_) => SignInPage()));
                    },
                    icon: Icon(Icons.verified_user, size: 18),
                    label: Text("                  Entrar                  "),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[500],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (_) => SignInPage()));
                    },
                    icon: Icon(Icons.person_add, size: 18),
                    label: Text("               Registrar               "),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
