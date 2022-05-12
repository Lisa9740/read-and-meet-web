import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/api/post.provider.dart';

class RenderPostsViewWithData extends StatelessWidget {
  const RenderPostsViewWithData({Key? key, required this.view, this.data}) : super(key: key);
  final data;
  final view;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<PostApiProvider>(context, listen: false).fetchPosts(),
        builder: (ct, postSnapshot) {
          if (postSnapshot.connectionState == ConnectionState.waiting) {
            return view([],  data);
          }

          if (postSnapshot.hasError) {
            print("error ${postSnapshot.error}");
            return const Scaffold(
                body: Center(
                  child: Text('Une erreur est survenue !'),
                ));
          }

          var posts = postSnapshot.data;
          print("posts: $posts");
          return view(posts, data);

        });
  }
}