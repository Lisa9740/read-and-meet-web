import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_and_meet_web/view/widgets/products/products.dart';

import '../../../../core/theme/app.theme.dart';
import '../../../../core/utils/layout/screen.layout.dart';


import '../../../widgets/datas/render.posts.data.dart';
import '../components/content/post-discover/post.discover.bloc.dart';
import '../components/header/top.content.dart';


UnauthenticatedHomeScreen(_key, context){
  final screenWidth = ScreenLayout.getScreenWidth(context);

  mapView(posts, position){
    return Container(color: Colors.black,
        width: screenWidth,
        child: DiscoverPostOnMapBlock(screenWidth, posts, context)
    );
  }


  return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Container(
              width: screenWidth,
              color: Colors.grey[100],
              child: TopContent(_key, context),
            ),
            Container(color: Colors.orange,
                width: screenWidth, height: 10,
                child: Text('')
            ),
            RenderPostsData(view: mapView),
            Container(color: AppTheme.mainColor,
                width: screenWidth, height: 10,
                child: Text('')
            ),
            Container(width: screenWidth,
                color: Colors.grey[100],
                child: Padding(padding: EdgeInsets.all(30), child:
                Text('Notre Catalogue', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.start,))
            ),
            Container(height: 300, child:
            const Products()),
            Container(color: Colors.orange,
                width: screenWidth, height: 10,
                child: Text('')
            ),
            Container(color:AppTheme.secondColor,
                width: screenWidth, height: ScreenLayout.getScreenHeigth(context) * 0.20,
                child: Text('Footer')
            )
          ]
      ));
}