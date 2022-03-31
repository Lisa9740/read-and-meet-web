import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/layout/screen.layout.dart';

class AuthContainer extends StatelessWidget{
  const AuthContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)),
        ),
        alignment: Alignment.center,
        width: !ScreenLayout.getContainerWidth(context).isSmallDevice ? ScreenLayout.getScreenWidth(context) / 2 :
        ScreenLayout.getScreenWidth(context) - 50,
        child: child
    );
  }

}