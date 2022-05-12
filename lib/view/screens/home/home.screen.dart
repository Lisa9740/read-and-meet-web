import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app.theme.dart';
import '../../../core/utils/layout/screen.layout.dart';
import '../../widgets/datas/render.posts.data.dart';
import 'components/content/books/books.dart';
import 'components/content/posts/posts.dart';
import 'components/top.content.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen ({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var buttonStyle = GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.w600);
  var postsLength;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenLayout.getScreenWidth(context);

    mapWithPost(posts, position){
      return Container(
          color: Colors.black,
          width: screenWidth,
          child: Posts(screenWidth, posts, context)
      );
    }

    return Scaffold(body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              TopContent(_key, context),
              Container(color: Colors.grey[100], height: 50),
              RenderPostsViewWithData(view: mapWithPost),
              booksSection(screenWidth, context),
              Container(
                  color: AppTheme.mainColor,
                  width: screenWidth,
                  height: 100,
                  child: Text('')
              ),
              Container(color: Colors.black,
                  width: screenWidth, height: ScreenLayout.getScreenHeigth(context) * 0.20,
                  child: Center(child:
                  Text('- Copyright© - 2022 - Contact', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),)
              ))
            ]
        )));
  }
}






