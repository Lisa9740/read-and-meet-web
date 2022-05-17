import 'package:flutter/cupertino.dart';
import '../../screens/posts/components/book.card.dart';
import '../datas/render.book.cover.data.dart';
import '../datas/render.books.data.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  Widget build(BuildContext context) {

    view(List books){
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            coverView(cover){
              if (cover != List.empty()) {
                return BookCard(book: books[index], image: cover,);
              }else{
                return BookCard(book: books[index]);
              }
            }
            return RenderBookCoverPath(uri: books[index].cover, view: coverView);
          });
    }
    return RenderBooksData(view: view);

  }
}