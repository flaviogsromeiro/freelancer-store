import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 239, 239, 239),
      highlightColor: const Color.fromARGB(255, 173, 173, 173),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        width: width,
        height: 12,
      ),
    );
  }
}