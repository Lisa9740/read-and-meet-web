import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/api/product.provider.dart';

class RenderProductsData extends StatelessWidget {
  const RenderProductsData({Key? key, required this.view, this.data}) : super(key: key);
  final data;
  final view;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ProductApiProvider>(context, listen: false).fetchProducts(),
        builder: (ct, productSnapshot) {
          if (productSnapshot.connectionState == ConnectionState.waiting) {
            return view([],  data);
          }

          if (productSnapshot.hasError) {
            print("error ${productSnapshot.error}");
            return const Scaffold(
                body: Center(
                  child: Text('Une erreur est survenue !'),
                ));
          }

          var products = productSnapshot.data;
          print("Products: $products");
          return view(products);

        });
  }
}