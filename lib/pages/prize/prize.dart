import 'package:flutter/material.dart';
import 'package:photo_quiz/pages/prize/components/image_carousel.dart';
import 'package:photo_quiz/pages/prize/images_service.dart';

class PrizePage extends StatefulWidget {
  final int level;
  const PrizePage({super.key, required this.level});

  @override
  State<PrizePage> createState() => _PrizePageState();
}

class _PrizePageState extends State<PrizePage> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    getImagesInDirectory("assets/images/${widget.level}/").then((images) {
      setState(() {
        imageUrls = images;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.level} completed!")),
      body: imageUrls.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ImageCarousel(imageUrls: imageUrls),
    );
  }
}
