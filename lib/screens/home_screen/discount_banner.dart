import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/models/product_model.dart';
import '../../size_config.dart';

class DiscountBanner extends StatefulWidget {
  @override
  _DiscountBannerState createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  int discountItem;

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(
          height: getProportionateScreenHeight(180.0),
          autoPlay: true,
          onPageChanged: (page, reason) {
            setState(() {
              discountItem = page;
            });
          }),
      items: productsList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: discountItem.toString());
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10.0),
                ),
                child: Image.asset(item.images[0]),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 7.0),
                decoration: BoxDecoration(
                  color: Color(0xFF10000000),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
