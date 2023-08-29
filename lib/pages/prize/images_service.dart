import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<String>> getImagesInDirectory(String directoryPath) async {
  print("Searching for images in $directoryPath");
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

  final images = manifestMap.keys
      .where((String key) => key.startsWith(directoryPath))
      .where((String key) => key.endsWith('.jpg') || key.endsWith('.png'))
      .toList();

  print("Images found $images");

  return images;
}
