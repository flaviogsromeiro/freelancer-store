import 'package:flutter/material.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';
import 'package:my_store/src/modules/product/view/widgets/card_product_list.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';
import 'package:my_store/src/ui/buttons/app_floating_action_button.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(title: 'Meus Produtos'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 0.8,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return CardProductList(
              model: ProductModel(
                titulo: 'Teste',
                descricao: '',
                tamanho: '',
                urlImagem:
                    'https://images.unsplash.com/photo-1516762689617-e1cffcef479d?q=80&w=1911&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                preco: '25.00',
              ),
            );
          },
        ),
      ),
      floatingActionButton: AppFloatingActionButton(
        action: () {},
      ),
    );
  }
}
