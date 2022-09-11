import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/models/product_model.dart';
import 'package:manan_mobile/screens/home_screen/section_title.dart';
import 'package:manan_mobile/screens/home_screen/special_offers.dart';
import 'package:manan_mobile/screens/product_screen/product_detail_page.dart';
import 'package:manan_mobile/size_config.dart';
import 'discount_banner.dart';
import 'home_search_bar.dart';
import 'home_products.dart';
import 'package:manan_mobile/services/authentication_methods.dart';
import 'category.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(12.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(12.0),
                ),
                child: HomeSearchBar(),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30.0),
              ),
              DiscountBanner(),
              SizedBox(
                height: getProportionateScreenHeight(30.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(12.0),
                ),
                child: Category(),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(24.0),
                ),
                child: SectionTitle(
                  text: "Special Offers",
                  press: () {},
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(12.0),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SpecialOffer(
                        image: "assets/images/special_offer1.png",
                        press: () {},
                        category: "Mobile Phones",
                      ),
                      SpecialOffer(
                        image: "assets/images/special_offer2.png",
                        press: () {},
                        category: "Others",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30.0),
              ),
              Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "All Products",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(20.0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(24.0),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(6.0),
                ),
                child: Products(
                  press: (product) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 800),
                        pageBuilder: (_, __, ___) => ProductDetailPage(productModel: product,),
                      ),
                    );
                    // Navigator.pushNamed(context, ProductDetailPage.routeName, arguments: ProductDetailArgument(productModel: product));
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
