// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';
import 'package:my_store/src/modules/product/view/pages/product_form_screen.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(
        title: 'Detalhes',
        action: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductFormScreen(
                  id: model.id,
                ),
              ),
            ),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          SizedBox(
            height: Utils.heightSize(context) * 0.45,
            child: Image.network(
              model.urlImage,
            ),
          ),
          Container(
            height: Utils.heightSize(context) * 0.12,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minTileHeight: 0,
                  horizontalTitleGap: 5,
                  leading: Icon(
                    Icons.label_important_outline,
                    color: Styles.tertiary,
                  ),
                  title: Text(
                    'Título',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Styles.tertiary,
                    ),
                  ),
                ),
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 30,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: Utils.heightSize(context) * 0.12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minTileHeight: 0,
                  horizontalTitleGap: 5,
                  leading: Icon(Icons.attach_money, color: Styles.tertiary),
                  title: Text(
                    'Preço',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Styles.tertiary),
                  ),
                ),
                Text(
                  model.price,
                  style: const TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: 0,
                    horizontalTitleGap: 5,
                    leading: Icon(Icons.local_offer, color: Styles.tertiary),
                    title: Text(
                      'Descrição',
                      style: TextStyle(
                        color: Styles.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    model.description,
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
