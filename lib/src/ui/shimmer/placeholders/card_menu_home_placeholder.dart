import 'package:flutter/material.dart';
import 'package:my_store/src/ui/shimmer/placeholders/title_placeholder.dart';
import 'package:shimmer/shimmer.dart';

class CardMenuHomePlaceholder extends StatelessWidget {
  const CardMenuHomePlaceholder({
    super.key,
    this.alignmentGeometry,
  });

  final AlignmentDirectional? alignmentGeometry;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 239, 239, 239),
      highlightColor: const Color.fromARGB(255, 173, 173, 173),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: alignmentGeometry,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 55,
            width: 55,
          ),
          const TitlePlaceholder(
            width: 50,
          ),
        ],
      ),
    );
  }
}
