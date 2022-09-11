import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/models/product_model.dart';
import 'package:manan_mobile/screens/product_screen/product_detail_page.dart';

import '../../size_config.dart';

class Products extends StatefulWidget {
  // final GestureTapCallback press;
  final Function(ProductModel) press;

  Products({this.press});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: productsList.map((product) {
        return GestureDetector(
          onTap: () {
            setState(() {
              widget.press(product);
            });
          },
          child: Hero(
            tag: product,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(6.0),
                vertical: getProportionateScreenHeight(6.0),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF10000000),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset(
                        product.images[0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: getProportionateScreenWidth(10.0),
                    left: getProportionateScreenWidth(10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10.0),
                        vertical: getProportionateScreenWidth(5.0),
                      ),
                      child: Text(
                        "\$${product.price}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: getProportionateScreenHeight(14.0),
                            fontWeight: FontWeight.w500),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF15000000),
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(5.0))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
