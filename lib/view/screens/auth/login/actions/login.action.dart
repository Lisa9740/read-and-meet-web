import 'package:provider/provider.dart';

import '../../../../../core/providers/api/auth.provider.dart';
import '../../../../../core/utils/notification.msg.dart';
import 'package:flutter/material.dart';

class LoginActions {
  LoginActions({ this.context});

  final context;



  signIn(String email, pass) async {
    Map data = {'email': email, 'password': pass};
    try {
      final response = await Provider.of<AuthApiProvider>(context, listen: false).login(data['email'], data['password']);

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