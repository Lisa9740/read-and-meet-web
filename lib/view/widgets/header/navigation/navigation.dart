import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../../core/utils/layout/screen.layout.dart';


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
        height: 100,
        child :
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30,),
              SizedBox(
                height: 80,
                width: ScreenLayout.getContainerWidth(context).containerWidth * 0.5,
                child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:  Image.asset(
                            "lib/assets/images/logo/book_logo_icon.png",
                          )),
                    ]
                ),

              ),
              const Spacer(),

            ])
    );
  }
}
