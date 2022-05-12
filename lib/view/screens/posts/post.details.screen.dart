import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/arguments/post.screen.arguments.dart';
import '../../../core/theme/constants.dart';
import '../../../core/utils/layout/screen.layout.dart';
import '../../widgets/avatar.dart';
import '../../widgets/buttons/rounded.corner.button.dart';
import '../../widgets/datas/render.book.cover.data.dart';
import '../../widgets/datas/render.books.data.by.post.dart';
import '../../widgets/datas/render.user.data.by.id.dart';
import 'components/book.card.dart';


class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({Key? key, this.currentPost}) : super(key: key);
  final currentPost;

  static const routeName = '/post-details';
  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var post;
    if (widget.currentPost == null) {
      final args = ModalRoute.of(context)!.settings.arguments as PostScreenArguments;
      post = args.post;
    }else {
      post = widget.currentPost;
    }

   
    returnPostAuthorName(user){
      return Text(user.name.toString(), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),);
    }


    // getting the size of the window
    var size = MediaQuery.of(context).size;
    var height = size.height;
    final PageController controller = PageController();

    return Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: [
              ListView(
                controller: controller,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(top:30, bottom: 30, left: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Avatar(picture: post.authorAvatar, width: 80, height: 80)
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RenderUserByIdData(id: post.userId, view: returnPostAuthorName),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  post.title,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Wrap(children: [
                                Text(post.description)
                              ],
                              )),
                          const SizedBox(height: 30,),
                        ],
                      )
                  ),
                  Column(
                    children: [
                      RenderBooksDataByPostId(id: post.postId, view: bookView),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: ScreenLayout.getScreenHeigth(context) / 6 ,
                          child: Center(
                              child: RoundedCornerButton(
                                width: double.parse("300"),
                                onTap: null,
                                child: const Text('Contacter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),)
                          ),
                          decoration: const BoxDecoration(
                            color: kBlackColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])

    );


  }


  bookView(books){
    return Container(
        height: 300,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              coverView(cover){
                if (cover != List.empty()) {
                  return BookCard(book: books[index], image: cover,);
                }else{
                  return BookCard(book: books[index]);
                }
              }
              return RenderBookCoverPath(uri: books[index].cover, view: coverView);
            })
    );
  }


}




