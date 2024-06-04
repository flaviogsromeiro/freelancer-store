import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_bloc.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_state.dart';
import 'package:my_store/src/modules/product/view/pages/product_form_screen.dart';
import 'package:my_store/src/modules/product/view/widgets/card_product_list.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';
import 'package:my_store/src/ui/buttons/app_floating_action_button.dart';
import 'package:my_store/src/ui/indicator/app_refresh_indicator.dart';
import 'package:my_store/src/ui/informatives/app_conditional_widget.dart';
import 'package:my_store/src/ui/informatives/app_list_empty.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(title: 'Meus Produtos'),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.initial ||
              state.status == ProductStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return AppConditionalWidget(
            condition: state.listOfProduct.isEmpty,
            firstChild:
                const AppListEmpty(message: 'Nenhum produto adicionado'),
            secondChild: AppRefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<ProductBloc>(context).getAll(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: state.listOfProduct.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => ProductFormScreen(
                                    id: state.listOfProduct[index].id!,
                                  )))
                          .then((value) {
                        setState(() {});
                      }),
                      child: CardProductList(
                        model: state.listOfProduct[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: AppFloatingActionButton(
        action: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProductFormScreen())),
      ),
    );
  }
}
