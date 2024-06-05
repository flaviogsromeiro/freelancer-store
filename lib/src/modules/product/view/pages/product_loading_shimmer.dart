import 'package:flutter/material.dart';
import 'package:my_store/src/ui/shimmer/placeholders/container_placeholder.dart';
import 'package:my_store/src/utils/utils.dart';

class ProductLoadingShimmer extends StatelessWidget {
  const ProductLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerPlaceholder(
            width: Utils.widthSize(context) * 0.9,
            heigth: Utils.heightSize(context) * 0.07),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 0.8,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ContainerPlaceholder(
                  heigth: Utils.heightSize(context) * 0.3,
                  width: Utils.widthSize(context) * 0.45,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
