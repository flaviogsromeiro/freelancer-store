// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';

class ImageProductScreen extends StatefulWidget {
  const ImageProductScreen({
    super.key,
    required this.listOfImages,
  });

  final List<String> listOfImages;

  @override
  State<ImageProductScreen> createState() => _ImageProductScreenState();
}

class _ImageProductScreenState extends State<ImageProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(title: 'Selecione uma imagem'),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 1,
        ),
        itemCount: widget.listOfImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, widget.listOfImages[index]);
            },
            child: _cardImage(
              widget.listOfImages[index],
            ),
          );
        },
      ),
    );
  }

  Widget _cardImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        fit: BoxFit.cover,
        url,
      ),
    );
  }
}
