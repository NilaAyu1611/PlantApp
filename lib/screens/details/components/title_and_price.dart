import 'package:flutter/material.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.title,
    required this.country,
    required this.price,
  }): super(key: key);

  final String title, country;
  final int price;


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}