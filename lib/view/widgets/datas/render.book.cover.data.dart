import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/api/book.provider.dart';



class RenderBookCoverPath extends StatelessWidget {
  const RenderBookCoverPath({Key? key, required this.uri, required Function this.view}) : super(key: key);
  final uri;
  final view;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<BookApiProvider>(context, listen: false).getBookImage(uri),
        builder: (ct, dataSnapshot) {
          var position = dataSnapshot.data;

          print("images $position");
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return view("");
          }
          if (dataSnapshot.hasData) {
            if (dataSnapshot.hasError) {
              print("erreur ${dataSnapshot.error}");
              return const Text(
                  'Une erreur est survenue lors de la récupération de la cover !');
            }

            return view(position);
          }
          return view([]);

        });
  }
}