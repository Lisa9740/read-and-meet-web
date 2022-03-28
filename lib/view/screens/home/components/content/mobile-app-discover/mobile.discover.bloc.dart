import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/theme/app.theme.dart';
import '../../../../../../../core/utils/layout/screen.layout.dart';

Widget mobileDiscoverBloc(context){
  final screenWidth = ScreenLayout.getScreenWidth(context);
  var buttonWidth = ScreenLayout.getScreenWidth(context) / 2;

  if (!ScreenLayout
      .getContainerWidth(context)
      .isSmallDevice) {buttonWidth = ScreenLayout.getScreenWidth(context) / 3;}

  return  Container(color: Colors.grey[200],
    width: screenWidth,
    child: Padding(padding: EdgeInsets.all(40),
        child:Column(
          children:  [
            const Padding(padding: EdgeInsets.only(top : 30, bottom: 15), child: Text("Ajouter une annonce ?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),)),
            const    Padding(padding: EdgeInsets.only(top : 30, bottom: 30), child: Text(
              "Vous avez des livres à mettre à disposition  gratuitement ou"
                  " à vendre ? \n Inscrivez-vous ou connectez-vous afin de gérer vos annonce",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontSize: 20),)),
            Container(color: Colors.orange,
              width: buttonWidth,
              child: const Padding(padding: EdgeInsets.all(20),
                  child: Text(
                    "Télécharger l'application ici !", textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
            ),
          ],
        )
    ),
  );
}