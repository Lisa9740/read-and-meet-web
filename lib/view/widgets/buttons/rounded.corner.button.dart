import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../core/theme/app.theme.dart';

class RoundedCornerButton extends StatefulWidget {
  final onTap;
  final child;
  final width;

  const RoundedCornerButton({Key? key, required this.onTap, this.child, this.width})
      : super(key: key);

  @override
  _RoundedCornerButtonState createState() => _RoundedCornerButtonState();
}


class _RoundedCornerButtonState extends State<RoundedCornerButton> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.appTheme().colorScheme.primary,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        hoverColor: Color(0xff5A4554),
        splashColor: Color(0xff5A4554),
        focusColor: Color(0xfff67f29),
        highlightColor:  Color(0xfff67f29),
        onTap: () {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            widget.onTap();
          });
        },
        borderRadius: BorderRadius.circular(55),
        child: Container(
            width: widget.width,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: widget.child
        ),
      ),
    );
  }
}
