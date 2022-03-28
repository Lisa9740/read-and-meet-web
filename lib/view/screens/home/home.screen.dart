import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_and_meet_web/view/screens/home/unauthenticated-home/unauthenticated.home.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/layout/screen.layout.dart';
import '../auth/login.screen.dart';
import 'authenticated-home/authenticated.home.screen.dart';


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
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    autoLogIn(context) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var user = prefs.getString("user");

      if (user != null) {
        setState(() {
          isLoggedIn = true;
        });

        return;
      }
    }

    renderMainView(){
      if (!isLoggedIn) {
        return FutureBuilder(
            future: autoLogIn(context),
            builder: (ct, authSnapshot) {
              return UnauthenticatedHomeScreen(_key, context);
            });
      }else {
        return const AuthenticatedHomeScreen() ;
      }
    }

    if (!ScreenLayout.getContainerWidth(context).isSmallDevice) {
      return Scaffold(
          body: renderMainView());
    }else {
      return Scaffold(
        key: _key,
        endDrawer: buildProfileDrawer(context),
        body: renderMainView(),
      );
    }
  }
}

buildProfileDrawer(context) {
  return Drawer(child: ListView(children: [
    DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: CircleAvatar(child:ClipOval(
          child:  Image.asset(
            "lib/assets/images/logo/book_logo.png",
            color: Colors.black,
            width: 30,
            height: 30,
          ),),
          backgroundColor:Colors.white,
        )),

    ListTile(
      leading: const Icon(Icons.login),
      title:  const Text('Se connecter'),
      onTap: () {
        Navigator.pushNamed(context, LoginScreen.routeName);
      },
    ),
    ListTile(
      leading: const Icon(Icons.login),
      title:  Text('S\'inscrire'),
      onTap: () {

      },
    ),
  ],),);
}




