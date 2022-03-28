import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/utils/layout/screen.layout.dart';
import '../../../../auth/login.screen.dart';




class Navigation extends StatelessWidget {
  Navigation({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey;

  loginBloc(context){
    if (!ScreenLayout.getContainerWidth(context).isSmallDevice) {
      return loginAndRegisterButton(context);
    }else {
      return drawerButton(globalKey, context);
    }
  }


  loginAndRegisterButton(context){
    return Row(
      children: [
        SizedBox(height: 30,
            width: ScreenLayout
                .getContainerWidth(context)
                .containerWidth * 0.50 / 3,
            child: TextButton(onPressed: () {

            },
                child: const Text('Mon panier'))),
        SizedBox(height: 30,
            width: ScreenLayout
                .getContainerWidth(context)
                .containerWidth * 0.50 / 3,
            child: TextButton(onPressed: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
                child: const Text('Se connecter'))),
        SizedBox(
            height: 30,
            width: ScreenLayout
                .getContainerWidth(context)
                .containerWidth * 0.50 / 3,
            child: TextButton(onPressed: () {},
                child: const Text('S\'inscrire'))),
      ],
    );
  }

  drawerButton(globalKey, context){
    return Padding(padding: const EdgeInsets.all(20), child: IconButton(onPressed: (){
      globalKey.currentState?.openEndDrawer();
    }, icon: const Icon(
      Icons.menu_outlined,
      color: Colors.black,
    )));
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child :
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30,),
              SizedBox(
                height: 50,
                width: ScreenLayout.getContainerWidth(context).containerWidth * 0.50,
                child: Row(
                    children: [
                   ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child:  Image.asset(
                      "lib/assets/images/logo/book_logo_icon.png",
                    )),
                      const SizedBox(width: 10,),
                    Image.asset(
                      "lib/assets/images/logo/letter_logo.png",
                      color: Colors.black,
                    ),
                    ]
                ),

              ),
              const Spacer(),
              loginBloc(context)

            ])
    );
  }
}
Widget setAppBar(GlobalKey<ScaffoldState> globalKey) {
  return AppBar(
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.account_circle),
        onPressed: () {
          globalKey.currentState?.openEndDrawer();
        },
      )
    ],
  );
}