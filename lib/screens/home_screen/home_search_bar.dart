import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../size_config.dart';
class HomeSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBar(),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20.0),
        ),
        BookMarks(),
        SizedBox(
          width: getProportionateScreenWidth(20.0),
        ),
        Cart(),
      ],
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: "Cart");
      },
      child: Container(
        height: getProportionateScreenHeight(50.0),
        width: getProportionateScreenHeight(50.0),
        child: Icon(
          EvaIcons.shoppingCartOutline,
          color: Color(0xFF80000000),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF15000000),
          borderRadius:
          BorderRadius.circular(getProportionateScreenWidth(10.0)),
        ),
      ),
    );
  }
}

class BookMarks extends StatelessWidget {
  const BookMarks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: "Bookmarks");
      },
      child: Container(
        height: getProportionateScreenHeight(50.0),
        width: getProportionateScreenHeight(50.0),
        child: Icon(
          EvaIcons.bookmarkOutline,
          color: Color(0xFF80000000),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF15000000),
          borderRadius:
          BorderRadius.circular(getProportionateScreenWidth(10.0)),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchItem = '';

    return Container(
      alignment: Alignment.centerLeft,
      height: getProportionateScreenHeight(50.0),
      width: SizeConfig.width * 0.60,
      decoration: BoxDecoration(
        color: Color(0xFF15000000),
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(15.0),
        ),
      ),
      child: TextField(
        onChanged: (val) {
          searchItem = val;
        },
        onSubmitted: (val) {
          Fluttertoast.showToast(msg: searchItem);
        },
        decoration: InputDecoration(
          hintText: "Search items",
          hintStyle: TextStyle(
            fontSize: getProportionateScreenHeight(18.0),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(EvaIcons.searchOutline),
        ),
      ),
    );
  }
}