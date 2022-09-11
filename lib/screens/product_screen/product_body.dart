import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/models/product_model.dart';
import 'package:manan_mobile/screens/product_screen/product_screen_images.dart';
import 'package:manan_mobile/widgets/custom_button.dart';

import '../../size_config.dart';

class ProductBody extends StatelessWidget {
  final ProductModel productModel;

  ProductBody({this.productModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(
            productModel: productModel,
          ),
          TopRoundedContainer(
            bottomPadding: true,
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  productModel: productModel,
                  press: () {
                    Fluttertoast.showToast(msg: "See Details");
                  },
                ),
              ],
            ),
          ),
          ColorSelection(
            productModel: productModel,
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenHeight(20.0),
              left: getProportionateScreenHeight(20.0),
            ),
            child: CustomButton(
              text: "ADD TO CART",
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool bottomPadding;

  TopRoundedContainer({@required this.child, this.color, this.bottomPadding});

  @override
  Widget build(BuildContext context) {
    bool padding = bottomPadding ?? false;
    return Container(
      padding: padding
          ? EdgeInsets.only(
              bottom: getProportionateScreenHeight(20.0),
            )
          : EdgeInsets.all(0),
      margin: EdgeInsets.only(
        left: getProportionateScreenHeight(10.0),
        right: getProportionateScreenHeight(10.0),
        top: getProportionateScreenHeight(10.0),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          getProportionateScreenHeight(20.0),
        ),
      ),
      child: child,
    );
  }
}

class ProductDescription extends StatelessWidget {
  final ProductModel productModel;
  final GestureTapCallback press;

  ProductDescription({this.productModel, this.press});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(15.0),
            horizontal: getProportionateScreenHeight(25.0),
          ),
          child: Text("${productModel.title}",
              style: Theme.of(context).textTheme.headline6),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(10.0)),
            width: getProportionateScreenHeight(75),
            child: Icon(
              productModel.isFavourite
                  ? EvaIcons.bookmark
                  : EvaIcons.bookmarkOutline,
              color: Colors.orange,
            ),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenHeight(15.0)),
                bottomLeft: Radius.circular(getProportionateScreenHeight(15.0)),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(25.0),
            vertical: getProportionateScreenHeight(10.0),
          ),
          child: Text(
            "${productModel.description}",
            maxLines: 3,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(25.0),
            vertical: getProportionateScreenHeight(4.0),
          ),
          child: GestureDetector(
            onTap: press,
            child: Row(
              children: [
                Text(
                  "See more details",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: getProportionateScreenHeight(20.0),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenHeight(4.0),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatefulWidget {
  final bool isSelected;
  final Color color;
  final GestureTapCallback press;

  ColorDot({Key key, this.isSelected, this.color, this.press})
      : super(key: key);

  @override
  _ColorDotState createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  @override
  Widget build(BuildContext context) {
    bool isSelectedColor = widget.isSelected ?? false;

    return GestureDetector(
      onTap: widget.press,
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenHeight(20),
          top: getProportionateScreenHeight(10),
          bottom: getProportionateScreenHeight(10),
        ),
        child: Container(
          padding: EdgeInsets.all(4.0),
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenHeight(40),
          decoration: BoxDecoration(
// color: Colors.orange
              border: Border.all(
                color: isSelectedColor ? Colors.orange : Colors.transparent,
                width: isSelectedColor ? 2.0 : 0.0,
              ),
              shape: BoxShape.circle),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class ColorSelection extends StatefulWidget {
  final ProductModel productModel;

  const ColorSelection({Key key, this.productModel}) : super(key: key);

  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    int selectedColor = 0;
    return TopRoundedContainer(
      color: Colors.white,
      child: Row(
        children: [
          ...List.generate(
            widget.productModel.colors.length,
            (index) => ColorDot(
              color: widget.productModel.colors[index],
              isSelected: selectedColor == index,
              press: () {
                setState(() {
                  selectedColor = index;
                });
                Fluttertoast.showToast(msg: "" + selectedColor.toString());
              },
            ),
          ),
          Spacer(),
          Container(
            height: getProportionateScreenHeight(40.0),
            width: getProportionateScreenHeight(40.0),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Icon(Icons.remove),
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: getProportionateScreenHeight(10.0),
          ),
          Container(
            margin: EdgeInsets.only(right: getProportionateScreenHeight(20.0)),
            height: getProportionateScreenHeight(40.0),
            width: getProportionateScreenHeight(40.0),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
