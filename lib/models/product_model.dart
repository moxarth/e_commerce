import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  ProductModel({
    @required this.title,
    @required this.description,
    @required this.images,
    @required this.price,
    this.colors,
    this.rating,
    this.isPopular,
    this.isFavourite,
  });
}

List<ProductModel> productsList = [
  ProductModel(
    title: "PS4 Controller",
    description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    images: [
      "assets/images/products/Image Popular Product 1.png",
      "assets/images/products/Image Popular Product 2.png",
      "assets/images/products/Image Popular Product 1.png",
      "assets/images/products/Image Popular Product 1.png",
    ],
    price: 24,
    rating: 4.5,
    isFavourite: true,
    colors: [
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.yellow,
    ]
  ),
  ProductModel(
    title: "Boxer",
    description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    images: [
      "assets/images/products/Image Popular Product 2.png",
      "assets/images/products/Image Popular Product 2.png",
      "assets/images/products/Image Popular Product 2.png",
    ],
    price: 10,
    rating: 4.1,
    isFavourite: false,
      colors: [
        Colors.red,
        Colors.green,
        Colors.orange,
        Colors.yellow,
      ]
  ),
  ProductModel(
    title: "Cycle Helmet",
    description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    images: [
      "assets/images/products/Image Popular Product 3.png",
      "assets/images/products/Image Popular Product 3.png",
      "assets/images/products/Image Popular Product 3.png",
      "assets/images/products/Image Popular Product 3.png",
    ],
    price: 24,
    rating: 4.8,
    isFavourite: true,
      colors: [
        Colors.red,
        Colors.green,
        Colors.orange,
        Colors.yellow,
      ]
  ),
  ProductModel(
    title: "Show",
    description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    images: [
      "assets/images/products/shoes2.png",
      "assets/images/products/shoes2.png",
      "assets/images/products/shoes2.png",
      "assets/images/products/shoes2.png",
    ],
    price: 24,
    rating: 4.0,
    isFavourite: false,
      colors: [
        Colors.red,
        Colors.green,
        Colors.orange,
        Colors.yellow,
      ]
  ),
  ProductModel(
    title: "T-Shirt",
    description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    images: [
      "assets/images/products/tshirt.png",
      "assets/images/products/tshirt.png",
      "assets/images/products/tshirt.png",
    ],
    price: 24,
    rating: 3.9,
    isFavourite: true,
      colors: [
        Colors.red,
        Colors.green,
        Colors.orange,
        Colors.yellow,
      ]
  ),
  ProductModel(
    title: "Wireless Headset",
    description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    images: [
      "assets/images/products/wireless headset.png",
      "assets/images/products/wireless headset.png",
      "assets/images/products/wireless headset.png",
    ],
    price: 24,
    rating: 4.3,
    isFavourite: false,
      colors: [
        Colors.red,
        Colors.green,
        Colors.orange,
        Colors.yellow,
      ]
  ),
];
