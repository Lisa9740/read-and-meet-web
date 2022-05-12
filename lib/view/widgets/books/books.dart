import 'package:flutter/cupertino.dart';
import '../../screens/posts/components/book.card.dart';
import '../datas/render.books.data.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    view(products){
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return BookCard(book: products[index]);
          });

    }
    return RenderBooksData(view: view);
  }
}