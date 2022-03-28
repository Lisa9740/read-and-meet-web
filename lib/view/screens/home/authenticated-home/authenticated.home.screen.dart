import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../core/providers/api/user.provider.dart';
import '../../../../core/storage/shared.pref.dart';
import '../../../../core/utils/layout/screen.layout.dart';
import '../../../widgets/datas/render.posts.data.dart';

import '../unauthenticated-home/components/home.bloc.map.dart';

class AuthenticatedHomeScreen extends StatefulWidget {
  const AuthenticatedHomeScreen ({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  _AuthenticatedHomeScreenState createState() => _AuthenticatedHomeScreenState();
}

class _AuthenticatedHomeScreenState extends State<AuthenticatedHomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  mapView(posts, position){
    return Container(color: Colors.black,
        width: MediaQuery.of(context).size.width ,

        child: MapBlock(MediaQuery.of(context).size.width, posts, context)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        endDrawer: buildProfileDrawer(context),
        body: FutureBuilder(
            future: UserApiProvider().getCurrent(),
            builder: (ct, authSnapshot) {
              if (authSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ));
              }else{
                return mainView(authSnapshot.data, context);
              }

            })
    );
  }


  mainView(data, context){
    return SingleChildScrollView(child: Column(children: [
      //AuthenticatedNav(globalKey: _key,),
      Padding(padding: EdgeInsets.only(bottom: 50), child: Text("Bienvenue ${data.name} !", style:Theme
          .of(context)
          .textTheme
          .headline3,)),
      Container(
        color: Colors.black,
        height: ScreenLayout.getScreenHeigth(context) / 2,
        child:  RenderPostsData(view: mapView),
      )
    ]));
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
      leading: const Icon(Icons.logout),
      title:  const Text('Se déconnecter'),
      onTap: () async {
        SharedPref.removeUserInfo();
        Navigator.pushNamed(context, "/");
      },
    ),
  ],),);
}
