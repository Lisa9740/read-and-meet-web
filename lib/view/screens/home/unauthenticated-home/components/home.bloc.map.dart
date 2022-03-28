import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/layout/breakpoints.dart';
import '../../../../widgets/google.map.view.dart';
import '../../../posts/post.details.screen.dart';



Widget MapBlock(screenWidth, posts, context){
  return screenWidth <= Breakpoints.tablet ? blockSmallScreen(posts) : blockWideScreen(posts);
}


Widget _contentText(){
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.all(20),child: Text("Découvrez les annonces dès maintenant !",
                style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),  textAlign: TextAlign.start)),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(20),
            child: Text('Vous avez un livre que vous vouler donnez ou échanger? \n'
                'Profiter des annonces posté par de potentiels rencontre littéraire où que vous soyez '
                'sur l\'île de la Réunion.',
              style: GoogleFonts.gudea(color: Colors.white, fontSize: 18, ), textAlign: TextAlign.start ,)),
      ]);
}


onMapMarkerTap(post, context){
  print(post.toString());
  PostDetailsScreen(currentPost: post,);
}


blockSmallScreen(posts){
  return Wrap(children: [
    Padding(padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          child: Container(
              child: _contentText()
          )),
     Container(
          child:GoogleMapView(posts: posts),
        )

  ]);
}

blockWideScreen(posts){
  return Row(children: [
    Expanded(
        flex: 1,
        child: Padding(padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 10),
          child : Container(
              child: _contentText()
          ),)),
    Expanded(
        flex: 3,
        child: Container(
          child:GoogleMapView(posts: posts),
        ))

  ]);
}