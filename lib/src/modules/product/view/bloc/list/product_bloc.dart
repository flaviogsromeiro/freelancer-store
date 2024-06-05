// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/src/core/extensions/parser_extension_object.dart';
import 'package:my_store/src/modules/product/controller/product_controller.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_state.dart';

class ProductBloc extends Cubit<ProductState> {
  final ProductController controller;

  ProductBloc(
    this.controller,
  ) : super(ProductState.initial());

  Future<void> getAll() async {
    try {
      emit(state.copyWith(status: ProductStatus.loading));

      await Future.delayed(const Duration(seconds: 1));

      final result = await controller.getAll();

      throwIf(result.isNull(), Exception());

      emit(state.copyWith(
          status: ProductStatus.loaded,
          listOfProduct: result,
          listOfProductFiltered: result));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.error,
          message: 'Falha ao carregar produtos',
        ),
      );
    }
  }

  Future<void> delete(String id) async {
    try {
      emit(state.copyWith(status: ProductStatus.loading));

      await controller.delete(id);

      emit(
        state.copyWith(
          status: ProductStatus.loaded,
          message: 'Produto excluído com sucesso',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.error,
          message: 'Falha ao excluir produto',
        ),
      );
    }
  }

  Future<void> search(String? text) async {
    if (!text.isNull()) {
      return emit(state.copyWith(
        status: ProductStatus.loaded,
        listOfProductFiltered: state.listOfProduct
            .where(
              (product) => ((product.title
                      .toLowerCase()
                      .contains(text!.toLowerCase())) ||
                  (product.price.toLowerCase().contains(text.toLowerCase()))),
            )
            .toList(),
      ));
    } else {
      return emit(state.copyWith(
        status: ProductStatus.loaded,
        listOfProductFiltered: state.listOfProduct,
      ));
    }
  }

  Future<void> showSearchBox() async {
    return emit(state.copyWith(showSearchBox: !state.showSearchBox));
  }
}
