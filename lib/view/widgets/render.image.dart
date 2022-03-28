
import 'package:flutter/cupertino.dart';

Widget renderImage(book, image){
  if (book.cover.startsWith("http")) {
    return Image.network(
      book.cover.toString(),
      alignment: Alignment.center,
      width: 80,
    );
  }else if (book.cover == ""){
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 125,
      color: Color(0xFF828376),
      child: Image.asset("lib/assets/images/logo/book_logo.png"),
    );
  }else {
    return Image.network(
      image.toString(),
      alignment: Alignment.center,
      width: 80,
    );
  }
}
