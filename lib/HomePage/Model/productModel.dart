import 'package:flutter/material.dart';

class ProductCard {
  final String coin;
  final String title;
  final String image;
  final String price;
  final String offerPrice;
  final String actualPrice;

  ProductCard(
    this.price,
    this.offerPrice,
    this.actualPrice, {
    required this.coin,
    required this.title,
    required this.image,
  });
}
