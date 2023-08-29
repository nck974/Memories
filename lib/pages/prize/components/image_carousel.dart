import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  const ImageCarousel({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Center(
          child: InteractiveViewer(
            boundaryMargin:
                const EdgeInsets.all(20.0), // Margin around the image
            minScale: 0.1, // Minimum scale to allow zoom out
            maxScale: 2.0, // Maximum scale to allow zoom in
            child: Image.asset(
              imageUrls[index],
              fit: BoxFit.contain, // Fit the image to the screen width
            ),
          ),
        );
      },
    );
  }
}
