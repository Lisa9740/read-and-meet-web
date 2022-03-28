import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  var height = 80;
  var width = 80;
  Avatar({Key? key, required this.picture, this.fit, required this.width, required this.height}) : super(key: key);
  final picture;
  final fit;

  @override
  Widget build(BuildContext context) {

    renderBoxFit(){
      if (fit != null){
          return fit;
      }else {
        return BoxFit.fill;
      }
    }

    return ClipOval(
        child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: NetworkImage(ValueKey(picture).value.toString()),
              fit: renderBoxFit(),
              width: double.parse(width.toString()),
              height: double.parse(height.toString()),
            )
        )
    );
  }
}