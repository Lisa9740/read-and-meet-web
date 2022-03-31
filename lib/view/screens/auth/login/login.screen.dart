import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:read_and_meet_web/view/screens/auth/login/components/login.form.dart';
import 'package:read_and_meet_web/view/screens/auth/register/register.screen.dart';

import '../../../../core/theme/app.theme.dart';
import '../../../../core/utils/layout/screen.layout.dart';
import '../../../widgets/auth/auth.container.dart';
import '../../../widgets/logo.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    _renderView(){
      return Container(
          width: ScreenLayout.getScreenWidth(context) ,
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AuthContainer(child: Padding(padding: EdgeInsets.only(bottom: 100),child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 100 , bottom: 20), child :
                  Logo(color: AppTheme.mainColor)),
                  Center(child: Padding(padding: EdgeInsets.only(top: 80 , bottom: 20),
                      child: Text("Connexion",
                        style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25), ))),
                  LoginForm(),
                  const Center(
                    child: Padding(padding: EdgeInsets.only(top: 20),child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                        color: AppTheme.secondColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                const RegisterScreen()),
                                (Route<dynamic> route) => false);
                      },
                      child: Center(
                          child: Text("S'inscrire", style: GoogleFonts.raleway(
                            color: AppTheme.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),))),
                ],),)),
            ],
          ));
    }

    return Scaffold(
        body: _renderView()
    );
  }
}
