import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../size_config.dart';


class Category extends StatelessWidget {
  List<Map<String, dynamic>> categoryList = [
    {"icon": EvaIcons.phone, "name": "Mobiles"},
    {"icon": EvaIcons.tv, "name": "TV"},
    {"icon": EvaIcons.carOutline, "name": "AC"},
    {"icon": EvaIcons.tvOutline, "name": "Laptop"},
    {"icon": EvaIcons.moreHorizotnalOutline, "name": "Others"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categoryList.length,
                (index) => Padding(
              padding: EdgeInsets.only(right: getProportionateScreenHeight(20.0)),
              child: CategoryCard(
                icon: categoryList[index]["icon"],
                name: categoryList[index]["name"],
                press: (){
                  Fluttertoast.showToast(msg: categoryList[index]["name"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final GestureTapCallback press;
  CategoryCard({this.icon, this.name, this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenHeight(60.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10.0),
                    color: Color(0x60ffff09)),
                child: Icon(
                  icon,
                  color: Colors.orange,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5.0),
            ),
            Text(
              "$name",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}