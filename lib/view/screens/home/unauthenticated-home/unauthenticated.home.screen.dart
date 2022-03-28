import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app.theme.dart';
import '../../../../core/utils/layout/screen.layout.dart';

import '../../../widgets/datas/render.posts.data.dart';
import 'components/home.bloc.map.dart';
import 'components/top.content.dart';



UnauthenticatedHomeScreen(_key, context){
  final screenWidth = ScreenLayout.getScreenWidth(context);

  mapView(posts, position){
    return Container(color: Colors.black,
        width: screenWidth,
        child: MapBlock(screenWidth, posts, context)
    );
  }

  return SingleChildScrollView(
      child: Column(
          children: [
            Container(
              width: screenWidth,
              color: Colors.grey[100],
              child: TopContent(_key, context),
            ),
            RenderPostsData(view: mapView),
            Container(color: Colors.orange,
                width: screenWidth, height: 10,
                child: Text('')
            ),
            Container(color: Colors.grey[200],
              width: screenWidth, height: ScreenLayout.getScreenHeigth(context) * 0.20,
              child: Padding(padding: EdgeInsets.all(20),
                  child:Column(
                    children:  [
                      const Text("Ajouter une annonce ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),),
                      const Text(
                        "Vous avez des livres à mettre à disposition  gratuitement ou"
                            " à vendre ? \n Inscrivez-vous ou connectez-vous afin de gérer vos annonce",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontSize: 20),),
                      Container(color: AppTheme.mainColor,
                          width: ScreenLayout.getScreenWidth(context) / 3 ,
                          child: const SizedBox(height: 50, child:
                          Text("Inscrivez-vous !", textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),)
                      ),
                    ],
                  )
              ),
            ),
            Container(color: Colors.black,
                width: screenWidth, height: ScreenLayout.getScreenHeigth(context) * 0.20,
                child: Text('Footer')
            )
          ]
      ));
}