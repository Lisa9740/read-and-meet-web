import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_and_meet_web/core/theme/app.theme.dart';
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
          SizedBox(
              width: ScreenLayout
                  .getContainerWidth(context)
                  .containerWidth * 0.50 / 3,
              child: InkWell(
                child: Wrap(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        size: 24.0,
                      ),
                      SizedBox(width: 5),
                      Text('Mon panier',
                          style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                    ]),
              )),
          SizedBox(
              width: ScreenLayout
                  .getContainerWidth(context)
                  .containerWidth * 0.50 / 3,
              child: InkWell(
                  onTap: (){Navigator.pushNamed(context, LoginScreen.routeName);},
                  child: Wrap(
                      children: [
                        const Icon(
                          Icons.login,
                          size: 24.0,
                        ), SizedBox(width: 5),
                        Text('Se connecter', style: GoogleFonts.raleway(fontWeight: FontWeight.bold),),
                      ]))),
          SizedBox(
            width: ScreenLayout
                .getContainerWidth(context)
                .containerWidth * 0.50 / 3,
            child:InkWell(
                onTap: (){Navigator.pushNamed(context, LoginScreen.routeName);},
                child: Wrap(
                    children: [ Text('S\'inscrire', style: GoogleFonts.raleway(fontWeight: FontWeight.bold, color: AppTheme.mainColor)),])
          ))]
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
                      !ScreenLayout.getContainerWidth(context).isSmallDevice ? Image.asset(
                        "lib/assets/images/logo/letter_logo.png",
                        color: Colors.black,
                      ) : Container(),
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