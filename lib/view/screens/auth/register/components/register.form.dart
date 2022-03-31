import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/layout/screen.layout.dart';
import '../../../../widgets/buttons/rounded.corner.button.dart';


class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isLoading = false;
  bool _isValid = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

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
            Wrap(children: [
              Padding(padding: EdgeInsets.only(top:20, bottom: 10), child:
              Container(
                width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 3 :
                ScreenLayout.getScreenWidth(context) - 100,
                child: TextFormField(
                  controller: lastname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez une valeur.';
                    }
                  },
                  //initialValue: 'Input text',
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(),
                  ),
                ),
              )),
              Container(
                width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 3 :
                ScreenLayout.getScreenWidth(context) - 100,
                child: TextFormField(
                  controller: firstname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez une valeur.';
                    }
                  },
                  //initialValue: 'Input text',
                  decoration: const InputDecoration(
                    labelText: 'Prénom',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],),
            Padding(padding: EdgeInsets.only(top:20, bottom: 10), child:
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
            )),
            Padding(padding: EdgeInsets.only(bottom: 10), child:
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
                ))),
            Container(
                width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 3 :
                ScreenLayout.getScreenWidth(context) - 100,
                child: TextFormField(
                  controller: confirmPassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre mot de passe.';
                    }
                    if (value == password.text) {
                      return 'Veuillez entrez un mot de passe identique.';
                    }
                    return null;
                  },
                  //initialValue: 'Input text',
                  decoration: const InputDecoration(
                      labelText: "Confirmer votre mot de passe",
                      border: OutlineInputBorder()
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            RoundedCornerButton(
              width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 4 :
              ScreenLayout.getScreenWidth(context) - 150,
              child: const Text('Commencez !', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), onTap: (){
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isLoading = true;
                });

              }
            },)
          ],
        )
    );

  }

}