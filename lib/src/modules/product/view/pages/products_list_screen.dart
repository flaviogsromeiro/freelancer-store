import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_bloc.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_state.dart';
import 'package:my_store/src/modules/product/view/pages/product_details_screen.dart';
import 'package:my_store/src/modules/product/view/pages/product_form_screen.dart';
import 'package:my_store/src/modules/product/view/pages/product_loading_shimmer.dart';
import 'package:my_store/src/modules/product/view/widgets/card_product_list.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';
import 'package:my_store/src/ui/buttons/app_action_appbar.dart';
import 'package:my_store/src/ui/buttons/app_floating_action_button.dart';
import 'package:my_store/src/ui/indicator/app_refresh_indicator.dart';
import 'package:my_store/src/ui/informatives/app_conditional_widget.dart';
import 'package:my_store/src/ui/informatives/app_list_empty.dart';
import 'package:my_store/src/utils/style/styles.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  late final TextEditingController controller;
  late final ProductBloc bloc;

  @override
  void initState() {
    controller = TextEditingController();
    bloc = BlocProvider.of<ProductBloc>(context);
    bloc.getAll();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(
        leading: const SizedBox.shrink(),
        action: [
          AppActionAppBar(
            action: () => bloc.showSearchBox(),
            icon: Icons.search,
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.initial ||
              state.status == ProductStatus.loading) {
            return const ProductLoadingShimmer();
          }

          return Column(
            children: [
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 0450),
                firstChild: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 15,
                    right: 15,
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Styles.primary,
                      ),
                      hintText: 'Ex.: Camiseta, Preço e etc',
                      // labelText: 'Pesquisar',
                      label: const Text('Pesquisar'),
                      contentPadding: const EdgeInsets.all(15),
                      labelStyle: TextStyle(color: Styles.primary),
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.primary,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.primary,
                        ),
                        gapPadding: 25,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    onChanged: (value) => bloc.search(value),
                  ),
                ),
                secondChild: const SizedBox.shrink(),
                crossFadeState: state.showSearchBox
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              AppConditionalWidget(
                condition: state.listOfProductFiltered.isEmpty,
                firstChild: Expanded(
                  child: AppListEmpty(
                      message: state.listOfProductFiltered.isEmpty &&
                              controller.text.isNotEmpty
                          ? 'Produto não encontrado'
                          : 'Nenhum produto adicionado'),
                ),
                secondChild: Expanded(
                  child: AppRefreshIndicator(
                    onRefresh: () async => bloc.getAll(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: state.listOfProductFiltered.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                        model: state
                                            .listOfProductFiltered[index])))
                                .then((value) {
                              setState(() {});
                            }),
                            child: CardProductList(
                              model: state.listOfProductFiltered[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Visibility(
            visible: state.status == ProductStatus.loaded,
            child: AppFloatingActionButton(
              action: () => Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => const ProductFormScreen()))
                  .then((_) {
                bloc.getAll();
              }),
            ),
          );
        },
      ),
    );
  }
}
