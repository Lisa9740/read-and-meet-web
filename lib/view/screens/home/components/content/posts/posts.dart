import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../../../../core/utils/layout/breakpoints.dart';

import '../../../../../../core/utils/layout/screen.layout.dart';
import '../../../../posts/post.details.screen.dart';
import 'download.app.text.dart';
import 'google.map.view.dart';



Widget Posts(screenWidth, posts, context){
  return screenWidth <= Breakpoints.tablet ? blockSmallScreen(posts, screenWidth,  context) : blockWideScreen(posts, context);
}


onMapMarkerTap(post, context){
  PostDetailsScreen(currentPost: post,);
}


blockSmallScreen(posts, screenWidth, context){
  return Column(children: [
    Padding(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        child: downloadAppText(context)
    ),
    Container(
      child:GoogleMapView(posts: posts),
    )

  ]);
}

blockWideScreen(posts, context){
  return Row(children: [
    Expanded(
        flex: 1,
        child:  Container(
          child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 10),
              child : downloadAppText(context)
          ),)),
    Expanded(
        flex: 3,
        child: Container(
          child:GoogleMapView(posts: posts),
        ))

  ]);
}