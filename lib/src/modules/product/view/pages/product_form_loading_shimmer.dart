import 'package:flutter/material.dart';
import 'package:my_store/src/ui/shimmer/placeholders/container_placeholder.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class ProductFormLoadingShimmer extends StatelessWidget {
  const ProductFormLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Styles.tertiary,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.heightSize(context) * 0.02,
          vertical: Utils.heightSize(context) * 0.02,
        ),
        decoration: BoxDecoration(
          color: Styles.quartenary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.95,
        child: Column(
          children: [
            const ContainerPlaceholder(width: double.infinity, heigth: 55),
            const SizedBox(
              height: 5,
            ),
            ContainerPlaceholder(
              width: double.infinity,
              heigth: Utils.widthSize(context) * 0.25,
            ),
            const SizedBox(
              height: 5,
            ),
            const ContainerPlaceholder(width: double.infinity, heigth: 55),
            const SizedBox(
              height: 5,
            ),
            const ContainerPlaceholder(width: double.infinity, heigth: 55),
            const SizedBox(
              height: 5,
            ),
            ContainerPlaceholder(
                width: double.infinity, heigth: Utils.widthSize(context) * 0.45)
          ],
        ),
      ),
    );
  }
}
