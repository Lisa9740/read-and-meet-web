import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:read_and_meet_web/view/screens/auth/register.screen.dart';

import '../../../core/providers/api/auth.provider.dart';
import '../../../core/theme/app.theme.dart';
import '../../../core/utils/notification.msg.dart';
import '../../../core/utils/layout/screen.layout.dart';
import '../../widgets/logo.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool _isValid = true;
  var errorMsg;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    _renderView(){
      if (ScreenLayout.getContainerWidth(context).isSmallDevice) {
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const SizedBox(height: 100),
            Logo(color: AppTheme.mainColor),
            const SizedBox(
              height: 60,
            ),
            const Center(child: Text("Connexion",
                style: TextStyle(color: AppTheme.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [

                    Container(
                      width: ScreenLayout.getScreenWidth(context) * 0.8,
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          _isValid
                              ? null
                              : "Veuillez entrez une adresse email valide.";
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrez une adresse email.';
                          }
                        },
                        //initialValue: 'Input text',
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: ScreenLayout.getScreenWidth(context) * 0.8,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrez votre mot de passe.';
                            }
                            return null;
                          },
                          //initialValue: 'Input text',
                          decoration: const InputDecoration(
                              labelText: "Mot de passe",
                              border: OutlineInputBorder()
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          _signIn(emailController.text, passwordController.text,
                              context);
                        }
                      },
                      child: const SizedBox(width: 300, child: Padding(padding: EdgeInsets.only(
                          top: 20, left: 60, right: 60, bottom: 20),
                          child: Text('Se connecter', textAlign: TextAlign.center,))),
                    ),
                  ],
                )
            ),
            errorMsg == null
                ? Container()
                : const Text(
              "Votre email/mot de passe est incorrect",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Mot de passe oublié ?',
                style: TextStyle(
                  color: AppTheme.secondColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  ),)),
            ),
          ],
        );
      }else{
        return  ListView(
          children: <Widget>[
            const SizedBox(height: 100),
            Logo(color: AppTheme.mainColor),
            const SizedBox(
              height: 60,
            ),
            const Center(child: Text("Connexion",
                style: TextStyle(color: AppTheme.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [

                    Container(
                      width: ScreenLayout.getScreenWidth(context) / 3,
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          _isValid
                              ? null
                              : "Veuillez entrez une adresse email valide.";
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrez une adresse email.';
                          }
                        },
                        //initialValue: 'Input text',
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: ScreenLayout.getScreenWidth(context) / 3,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrez votre mot de passe.';
                            }
                            return null;
                          },
                          //initialValue: 'Input text',
                          decoration: const InputDecoration(
                              labelText: "Mot de passe",
                              border: OutlineInputBorder()
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          _signIn(emailController.text, passwordController.text,
                              context);
                        }
                      },
                      child: const Padding(padding: EdgeInsets.only(
                          top: 20, left: 60, right: 60, bottom: 20),
                          child: Text('Se connecter')),
                    ),

                  ],
                )
            ),
            errorMsg == null
                ? Container()
                : const Text(
              "Votre email/mot de passe est incorrect",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Mot de passe oublié ?',
                style: TextStyle(
                  color: AppTheme.secondColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  ),)),
            ),

          ],
        );
      }
    }

    return Scaffold(
        body: _isLoading
            ? const Center(child: CircularProgressIndicator(color: Color(0xffA03E99),))
            :  _renderView()

    );
  }


  _signIn(String email, pass, context) async {
    Map data = {'email': email, 'password': pass};
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();

      final response = await Provider.of<AuthApiProvider>(context, listen: false).login(data['email'], data['password']);
      setState(() {
        _isLoading = false;
      });
      if (response != null) {
        NotificationMsg.showSnackBar("Connexion réussi !", true, context);
        Navigator.pushNamed(context, '/');
      }else {
        NotificationMsg.showSnackBar("Votre email et/ ou mot de passe est erroné !", false, context);
      }
    }catch(e){
      print(e);
      NotificationMsg.showSnackBar('Une erreur est survenue !', false, context);
    }
  }
}
