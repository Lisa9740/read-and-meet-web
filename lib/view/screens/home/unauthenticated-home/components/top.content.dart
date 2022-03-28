import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/app.theme.dart';
import '../../../../../core/utils/layout/screen.layout.dart';
import 'navigation/navigation.dart';

Widget TopContent(_key, context){


  var buttonWidth = ScreenLayout.getScreenWidth(context) / 2;

  if (!ScreenLayout
      .getContainerWidth(context)
      .isSmallDevice) {buttonWidth = ScreenLayout.getScreenWidth(context) / 3;}


  return Column(
    children: [
      Wrap(children: [
        Navigation(globalKey: _key)
      ],),
      const SizedBox(height: 10),
      Container(
          child: Image.asset(
            "lib/assets/images/logo/book_logo.png",
            color: Colors.black,
            alignment: Alignment.center,
          )
      ),
      const SizedBox(height: 20),
      SizedBox(
        width:  ScreenLayout.getContainerWidth(context).containerWidth * 0.60 - 5,
        child:
        Column(children: [
          Text(
            'Bienvenue sur Read And Meet !',
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge,
          ),
        ],),
      ),const SizedBox(height: 5),
      const SizedBox(height: 5),
      Padding(padding: const EdgeInsets.all(20), child: Container(
        width:  ScreenLayout.getContainerWidth(context).containerWidth * 0.60 - 5,
        child : RichText(
          text: TextSpan(text:
          'Vous aimer lire ? Vous voulez rencontrez des gens et discuter de vos lectures?\n'
              'Cela tombe bien notre appli ReadAndMeet est là pour vous !\n  \n',
            style: GoogleFonts.gudea(fontSize: 25, color: Colors.black ),
          ),
          textAlign: TextAlign.center,
        ),)),
      const SizedBox(width: 35, height: 10,),
      Container(color: AppTheme.mainColor,
        width: buttonWidth,
        child: const Padding(padding: EdgeInsets.all(20),
            child: Text(
              "Télécharger l'application ici !", textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
      const SizedBox(height: 50,),

    ],
  );
}