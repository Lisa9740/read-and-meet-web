import 'package:flutter/cupertino.dart';
import 'package:read_and_meet_web/view/widgets/datas/render.products.data.dart';
import 'package:read_and_meet_web/view/widgets/products/product.card.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    view(products){
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product : products[index]);
          });

    }
    return RenderProductsData(view: view);
  }
}