import 'package:flutter/material.dart';

class GiftCard {
  final LinearGradient backgroundColor;
  final String title;
  final String offerText;
  final String buttonText;
  final String image;
  final bool applied;

  GiftCard({
    required this.backgroundColor,
    required this.title,
    required this.offerText,
    required this.buttonText,
    required this.image,
    required this.applied,
  });
}
