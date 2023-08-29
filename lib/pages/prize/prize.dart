import 'package:flutter/material.dart';
import 'package:photo_quiz/pages/prize/components/image_carousel.dart';

class PrizePage extends StatefulWidget {
  final int level;
  const PrizePage({super.key, required this.level});

  @override
  State<PrizePage> createState() => _PrizePageState();
}

class _PrizePageState extends State<PrizePage> {
  final List<String> imageUrls = [
    'assets/images/1/IMG_20230105_124317.jpg',
    'assets/images/1/IMG_20230105_143752.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.level} completed!")),
      body: ImageCarousel(imageUrls: imageUrls),
    );
  }
}
