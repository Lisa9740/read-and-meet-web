import 'package:flutter/material.dart';
import 'package:read_and_meet_web/core/theme/app.theme.dart';

import '../../../../core/routes/arguments/book.screen.arguments.dart';
import '../../../../core/theme/constants.dart';
import '../../../widgets/buttons/two.side.rounded.btn.dart';
import '../../../widgets/render.image.dart';


class PostDetailsBookCard extends StatelessWidget {
  final book;
  final image;

  const PostDetailsBookCard({
    Key? key,
    this.image,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Future<String> _calculation = Future<String>.delayed(
      const Duration(seconds: 1),
          () => 'Data Loaded',
    );

    return Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 24, bottom: 40),
            height: 245,
            width: 202,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 221,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 33,
                          color: AppTheme.mainColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FutureBuilder<String>(
                          future: _calculation, // a previously-obtained Future<String> or null
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return renderImage(book, image);
                            }
                            return CircularProgressIndicator(color: Colors.orange);
                          })
                    ],
                  ),
                ),
                Positioned(
                  top: 160,
                  child: Container(
                    height: 85,
                    width: 202,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: RichText(
                            maxLines: 2,
                            text: TextSpan(
                              style: const TextStyle(color: kBlackColor),
                              children: [
                                TextSpan(
                                  text: "${book.title}\n",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: book.author.toString(),
                                  style: const TextStyle(
                                    color: kLightBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => {
                                Navigator.pushNamed(context, "/book-details", arguments: BookScreenArguments(book))
                              },
                              child: Container(
                                width: 101,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                child: Text("Voir"),
                              ),
                            ),
                            Expanded(
                              child: TwoSideRoundedButton(
                                text: "${book.price} €",
                                press: ()  => {},
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )]);
  }
}