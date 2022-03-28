import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../core/providers/api/book.provider.dart';

class RenderBooksData extends StatelessWidget {
  const RenderBooksData({Key? key, required this.id, required Function this.view}) : super(key: key);
  final id;
  final view;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<BookApiProvider>(context, listen: false).getByPostId(id),
        builder: (ct, dataSnapshot) {
          var position = dataSnapshot.data;
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return view([]);
          }
          if (dataSnapshot.hasError) {
            print(dataSnapshot.error);
            return const Text('Une erreur est survenue lors de la récupération d\'adresse !');
          }

          return view(position);
        });
  }
}