
import 'package:flutter/cupertino.dart';
import '../../models/device.dart';

class ScreenLayout{

  static double getScreenWidth(context){
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeigth(context){
    return MediaQuery.of(context).size.height;
  }


  static DeviceParams getContainerWidth(BuildContext context){
    final double width = MediaQuery.of(context).size.width;

    if (width >= 1200){
      return DeviceParams(isSmallDevice: false, containerWidth: width * 0.6);
    }else if (width >= 992){
      return DeviceParams(isSmallDevice: false, containerWidth: width * 0.7);
    }else if (width >= 768){
      return DeviceParams(isSmallDevice: false, containerWidth: width * 0.8);
    }else{
      return DeviceParams(isSmallDevice: true, containerWidth: width);
    }
  }
}