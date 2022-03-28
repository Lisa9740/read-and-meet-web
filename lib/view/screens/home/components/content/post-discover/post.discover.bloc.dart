import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../../../../core/utils/layout/breakpoints.dart';

import '../../../../posts/post.details.screen.dart';
import 'post.map.text.dart';
import 'google.map.view.dart';



Widget DiscoverPostOnMapBlock(screenWidth, posts, context){
  return screenWidth <= Breakpoints.tablet ? blockSmallScreen(posts, context) : blockWideScreen(posts, context);
}



onMapMarkerTap(post, context){
  print(post.toString());
  PostDetailsScreen(currentPost: post,);
}


blockSmallScreen(posts, context){
  return Wrap(children: [
    Padding(padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        child: Container(
            child: DiscoverPostOnMapTextContent(context)
        )),
    Container(
      child:GoogleMapView(posts: posts),
    )

  ]);
}

blockWideScreen(posts, context){
  return Row(children: [
    Expanded(
        flex: 1,
        child: Padding(padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 10),
          child : Container(
              child: DiscoverPostOnMapTextContent(context)
          ),)),
    Expanded(
        flex: 3,
        child: Container(
          child:GoogleMapView(posts: posts),
        ))

  ]);
}