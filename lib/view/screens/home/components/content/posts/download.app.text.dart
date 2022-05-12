import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/utils/layout/screen.layout.dart';

Widget downloadAppText(context){

  var buttonWidth = ScreenLayout.getScreenWidth(context) / 5;
  return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.all(20),child: Text("Des livres d'occasions à vendre ?",
            style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),  textAlign: TextAlign.start)),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.all(20),
            child: Text('Vous avez un livre que vous vouler donnez ou échanger? \n'
                'Profiter des annonces posté par de potentiels rencontre littéraire où que vous soyez '
                'sur l\'île de la Réunion.',
              style: GoogleFonts.gudea(color: Colors.white, fontSize: 18, ), textAlign: TextAlign.start ,)),
        SizedBox(height: 30),
        Container(color: Colors.orange,
          width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? buttonWidth : ScreenLayout.getScreenWidth(context) / 2,
          child: const Padding(padding: EdgeInsets.all(20),
              child: Text(
                "Télécharger l'application ici !", textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
        ),
      ]);
}