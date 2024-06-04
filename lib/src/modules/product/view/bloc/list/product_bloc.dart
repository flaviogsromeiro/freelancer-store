// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/core/extensions/parser_extension_object.dart';
import 'package:my_store/src/modules/product/controller/product_controller.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_state.dart';

class ProductBloc extends Cubit<ProductState> {
  final ProductController controller;

  ProductBloc(
    this.controller,
  ) : super(ProductState.initial());

  Future<void> getAll() async {
    try {
      emit(state.copyWith(status: ProductStatus.loading));

      final result = await controller.getAll();

      emit(state.copyWith(status: ProductStatus.loaded, listOfProduct: result));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error));
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

  

  

  
}
