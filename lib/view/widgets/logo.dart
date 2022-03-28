import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Logo extends StatelessWidget {
  const Logo({Key? key, this.minWidth, this.maxWidth, this.minHeight, this.maxHeight, Color? this.color}) : super(key: key);

  final minWidth;
  final maxWidth;
  final minHeight;
  final maxHeight;
  final color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: OverflowBox(
          minWidth: ValueKey(minWidth).value ?? 0.0,
          maxWidth: ValueKey(maxWidth).value ?? 210.0,
          minHeight: ValueKey(minHeight).value ?? 200.0,
          maxHeight:ValueKey(maxHeight).value ??  280.0,
          child:
          SizedBox(
            height: 150,
            child: SvgPicture.asset(
              "lib/common/assets/images/logo/logo.svg",
              color: color,
            ),
          ),
        )
    );
  }
}