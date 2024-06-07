// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class CardProductList extends StatelessWidget {
  const CardProductList({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.heightSize(context) * 0.3,
      width: Utils.widthSize(context) * 0.45,
      margin: EdgeInsets.symmetric(
          vertical: Utils.heightSize(context) * 0.015,
          horizontal: Utils.widthSize(context) * 0.02),
      decoration: BoxDecoration(
        color: Styles.tertiary,
        border: Border.all(color: Styles.primary),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(fit: BoxFit.cover, model.urlImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  model.price,
                  style: TextStyle(
                      color: Styles.secondary,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
