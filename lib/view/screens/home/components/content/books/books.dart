import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app.theme.dart';
import '../../../../../widgets/books/books.dart';

Widget booksSectionTitle(screenWidth, context) {
  return  Container(width: screenWidth,
      child: Padding(padding: EdgeInsets.all(30), child:
      Text('Livres disponible depuis les annonces',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.start,))
  );
}

Widget booksSection(screenWidth, context){
  return Column(children: [
    booksSectionTitle(screenWidth, context),
    Container(height: 300,
        child: const Books()),

  ],);
}