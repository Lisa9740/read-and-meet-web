import 'package:flutter/material.dart';

class Palette {

  static const MaterialColor purpleColor = MaterialColor(
    0xffA03E99, // Normal comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0x1aa03e99), //10%
      100: Color(0x33a03e99), //20%
      200: Color(0x4da03e99), //30%
      300: Color(0x66a03e99), //40%
      400: Color(0x80a03e99), //50%
      500: Color(0x99a03e99), //60%
      600: Color(0xb3a03e99), //70%
      700: Color(0xcca03e99), //80%
      800: Color(0xe6a03e99), //90%
      900: Color(0xffa03e99), //100%
    },
  );
}