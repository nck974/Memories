import 'package:flutter/material.dart';

class PhotoCounter extends StatelessWidget {
  const PhotoCounter({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            currentPage.toString(), // Current image index
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            ' / $totalPages', // Total number of images
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
