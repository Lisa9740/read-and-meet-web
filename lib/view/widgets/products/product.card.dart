import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/models/product.dart';
import '../../../core/theme/constants.dart';
import '../buttons/two.side.rounded.btn.dart';


class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, this.product}) : super(key: key);

  final product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
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
                          color: kShadowColor,
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

                  ]
                )),
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
                                  text: "${product.name}\n",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
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
                                text: "${product.price} €",
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