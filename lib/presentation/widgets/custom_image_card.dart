
import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final String imagePath;
  final double ratio;
  final double? width;
  const CustomImageCard({
    Key? key,
    required this.imagePath,
    required this.ratio,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: AspectRatio(
        aspectRatio: ratio,
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
