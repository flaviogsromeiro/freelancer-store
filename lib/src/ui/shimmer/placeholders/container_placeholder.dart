// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class ContainerPlaceholder extends StatelessWidget {
  const ContainerPlaceholder({
    required this.width,
    required this.heigth,
    super.key,
    this.borderRadius,
  });

  final double width;
  final double heigth;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 235, 235, 235),
      highlightColor: const Color.fromARGB(255, 205, 204, 204),
      child: Container(
        width: width,
        height: heigth,
        margin: EdgeInsets.symmetric(
            vertical: Utils.heightSize(context) * 0.015,
            horizontal: Utils.widthSize(context) * 0.02),
        decoration: BoxDecoration(
          color: Styles.tertiary,
          border: Border.all(color: Styles.primary),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
