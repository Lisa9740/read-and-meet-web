import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_and_meet_web/core/theme/app.theme.dart';
import 'package:read_and_meet_web/view/screens/auth/register/register.screen.dart';
import '../../../../../../../core/utils/layout/screen.layout.dart';
import '../../../screens/auth/login/login.screen.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key, required this.globalKey}) : super(key: key);
  final GlobalKey<ScaffoldState> globalKey;
  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation>{
  var navigationColorLink = Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                width: ScreenLayout.getContainerWidth(context).containerWidth * 0.5,
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
              (!ScreenLayout.getContainerWidth(context).isSmallDevice) ?
              Row(
                  crossAxisAlignment :CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: ScreenLayout
                            .getContainerWidth(context)
                            .containerWidth * 0.5 / 2.5,
                        child: InkWell(
                          onHover:  (hovering) {
                            setState(() {
                              navigationColorLink = Colors.black;
                            });
                            if (hovering) {
                              setState(() {
                                navigationColorLink = Colors.orange;
                              });
                            }
                          },
                          onTap: (){ Navigator.pushNamed(context, LoginScreen.routeName); },
                          child: Wrap(
                              children: [
                               Icon(
                                  Icons.shopping_cart,
                                  color: navigationColorLink,
                                  size: 24.0,
                                ),
                                SizedBox(width: 5),
                                Text('Mon panier',
                                    style: GoogleFonts.raleway(fontWeight: FontWeight.bold, color: navigationColorLink)),
                              ]),
                        )),
                    SizedBox(
                        width: ScreenLayout
                            .getContainerWidth(context)
                            .containerWidth * 0.5 / 2.5,
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
                            .containerWidth * 0.5 / 2.5,
                        child:InkWell(
                            onTap: (){Navigator.pushNamed(context, RegisterScreen.routeName);},
                            child: Wrap(
                                children: [ Text('S\'inscrire', style: GoogleFonts.raleway(fontWeight: FontWeight.bold, color: AppTheme.mainColor)),])
                        ))]
              ) :
              loginBloc(context)

            ])
    );
  }


  loginBloc(context){
      return drawerButton(widget.globalKey, context);
  }


  drawerButton(globalKey, context){
    return Padding(padding: const EdgeInsets.all(20), child: IconButton(onPressed: (){
      globalKey.currentState?.openEndDrawer();
    }, icon: const Icon(
      Icons.menu_outlined,
      color: Colors.black,
    )));
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
}
