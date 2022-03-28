import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/logo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';


  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  var errorMsg;
  bool _isLoading = false;
  bool _isValid = true;
  final _formKey = GlobalKey<FormState>();
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14), primary: const Color(0xffA03E99));
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              const SizedBox(height: 100),
              const Logo(),
              const SizedBox(
                height: 60,
              ),
              const Center(child: Text("Inscription",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child : Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value){
                          _isValid ? null :  "Veuillez entrez une adresse email valide.";
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            setState(() {
                              _isLoading = true;
                            });
                            //_signIn(emailController.text, passwordController.text, context);
                          }
                        },
                        child: const Text('Se connecter'),
                      ),
                    ],
                  )
              ),
            ]
        )
    );

  }
}