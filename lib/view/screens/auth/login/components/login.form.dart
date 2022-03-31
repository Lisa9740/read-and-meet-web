import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/layout/screen.layout.dart';
import '../../../../widgets/buttons/rounded.corner.button.dart';
import '../actions/login.action.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  bool _isValid = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 3 :
              ScreenLayout.getScreenWidth(context) - 100,
              child: TextFormField(
                controller: email,
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
                width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 3 :
                ScreenLayout.getScreenWidth(context) - 100,
                child: TextFormField(
                  controller: password,
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
            RoundedCornerButton(
              width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 4 :
              ScreenLayout.getScreenWidth(context) - 150,
              child: const Text('Se connecter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), onTap: (){
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isLoading = true;
                });
                LoginActions(context: context).signIn(email.text, password.text,);
              }
            },)
          ],
        )
    );

  }

}