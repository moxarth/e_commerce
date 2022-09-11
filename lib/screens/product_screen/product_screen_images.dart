import 'package:flutter/material.dart';
import 'package:manan_mobile/models/product_model.dart';

import '../../size_config.dart';

class ProductImages extends StatefulWidget {
  final ProductModel productModel;

  ProductImages({this.productModel});

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenHeight(300),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.productModel,
              child: Container(
                width: SizeConfig.width,
                height: getProportionateScreenHeight(300.0),
                child: Image.asset(widget.productModel.images[selectedImage]),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.productModel.images.length,
                  (index) => buildImagePreview(index),
            ),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(12.0),)
      ],
    );
  }

  GestureDetector buildImagePreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          right: getProportionateScreenHeight(12.0),
        ),
        padding: EdgeInsets.all(
          getProportionateScreenHeight(4.0),
        ),
        height: getProportionateScreenHeight(52),
        width: getProportionateScreenHeight(52),
        child: Image.asset(widget.productModel.images[index]),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            getProportionateScreenHeight(10.0),
          ),
          border: Border.all(
            color: selectedImage == index
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
        ),
      ),
    );
  }
}