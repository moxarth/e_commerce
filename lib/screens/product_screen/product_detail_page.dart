import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:manan_mobile/models/product_model.dart';
import 'package:manan_mobile/screens/product_screen/product_body.dart';

import '../../size_config.dart';
import 'custom_app_bar.dart';

class ProductDetailPage extends StatelessWidget {
  static String routeName = '/productPage';

  final ProductModel productModel;

  ProductDetailPage({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        rating: productModel.rating,
      ),
      body: ProductBody(productModel: productModel,),
    );
  }
}


// we need the product from the previous page so need to make an argument class
// class ProductDetailArgument{
//   final ProductModel productModel;
//
//   ProductDetailArgument({this.productModel});
// }
