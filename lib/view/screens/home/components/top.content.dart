import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_and_meet_web/core/theme/app.theme.dart';
import 'package:read_and_meet_web/view/widgets/buttons/rounded.corner.button.dart';

import '../../../../../core/utils/layout/screen.layout.dart';

import '../../../widgets/header/navigation/navigation.dart';

Widget TopContent(_key, context){
  return Column(
    children: [
      Wrap(children: [
        Navigation(globalKey: _key)
      ],),
      const SizedBox(height: 10),
      Container(
        width: 200,
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
            style: AppTheme.appTheme()
                .textTheme
                .headlineLarge,
          ),
        ],),
      ),const SizedBox(height: 5),
      Padding(padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0), child: Container(
        width:  ScreenLayout.getContainerWidth(context).containerWidth * 0.60 - 5,
        child : RichText(
          text: TextSpan(text:
          'Vous aimer lire ? Vous voulez parler d\'un livre ? ReadAndMeet est fait pour vous !\n  \n',
            style: GoogleFonts.spaceMono(fontSize: 25, color: Colors.black ),
          ),
          textAlign: TextAlign.center,
        ),)),
      RoundedCornerButton(onTap: null, child: Text("Lire nos articles", style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold),), width: ScreenLayout.getContainerWidth(context).containerWidth * 0.60 - 5,),
      const SizedBox(height: 80),
    ],
  );
}