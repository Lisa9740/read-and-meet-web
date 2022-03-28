import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../core/providers/api/user.provider.dart';

class RenderUserByIdData extends StatelessWidget {
  const RenderUserByIdData({Key? key, required this.id,  required Function this.view}) : super(key: key);
  final view;
  final id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<UserApiProvider>(context, listen: false).getById(id),
        builder: (ct, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Text('');
          }else if (userSnapshot.connectionState == ConnectionState.active ||
              userSnapshot.connectionState == ConnectionState.done) {
            if (userSnapshot.hasData) {
              var user = userSnapshot.data;
              return view(user);
            }
          }
          return const Scaffold(
              body: Center(
                child: Text('Une erreur est survenue !'),
              )
          );
        });
  }
}