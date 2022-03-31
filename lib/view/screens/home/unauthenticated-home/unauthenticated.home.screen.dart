import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_and_meet_web/view/widgets/products/products.dart';

import '../../../../core/theme/app.theme.dart';
import '../../../../core/utils/layout/screen.layout.dart';


import '../../../widgets/datas/render.posts.data.dart';
import '../components/content/post-discover/post.discover.bloc.dart';
import '../components/top.content.dart';


UnauthenticatedHomeScreen(_key, context){
  final screenWidth = ScreenLayout.getScreenWidth(context);

  mapView(posts, position){
    return Container(
     /*   decoration : const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image:  AssetImage(
              "lib/assets/images/background.png",
            ))),*/
      color: Colors.black,
        width: screenWidth,
        child: DiscoverPostOnMapBlock(screenWidth, posts, context)
    );
  }


  var buttonWidth = ScreenLayout.getScreenWidth(context) / 3;

  return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Container(
              width: screenWidth,
              color: Colors.grey[100],
              child: TopContent(_key, context),
            ),
            Container(
                width: screenWidth, height: 1,
                decoration: const BoxDecoration(
                  boxShadow: [
                  //background color of box
                    BoxShadow(
                      color: AppTheme.secondColor,
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: Offset(0, -10),
                    )
                  ],
                ),
                child: Text('')
            ),
            RenderPostsData(view: mapView),
            Container(width: screenWidth,
                child: Padding(padding: EdgeInsets.all(30), child:
                Text('Notre Catalogue', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.start,))
            ),
            Container(height: 300, child:
            const Products()),
            Container(
                color: AppTheme.mainColor,
                width: screenWidth,
                height: 300,
                child: Text('')

            ),
            Container(color: Colors.black,
                width: screenWidth, height: ScreenLayout.getScreenHeigth(context) * 0.20,
                child: Text('Footer')
            )
          ]
      ));
}