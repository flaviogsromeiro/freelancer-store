// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/core/extensions/parser_extension_object.dart';
import 'package:my_store/src/modules/product/controller/product_controller.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';
import 'package:my_store/src/modules/product/view/bloc/product_state.dart';

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

  Future<void> create(ProductModel model) async {
    try {
      emit(state.copyWith(status: ProductStatus.loading));

      await controller.post(model);

      emit(
        state.copyWith(
          statusForm: ProductFormStatus.created,
          message: 'Produto criado com sucesso',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          statusForm: ProductFormStatus.error,
          message: 'Falha ao criar produto',
        ),
      );
    }
  }

  Future<void> delete(String id) async {
    try {
      emit(state.copyWith(statusForm: ProductFormStatus.loading));

      await controller.delete(id);

      emit(
        state.copyWith(
          statusForm: ProductFormStatus.deleted,
          message: 'Produto excluído com sucesso',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          statusForm: ProductFormStatus.error,
          message: 'Falha ao excluir produto',
        ),
      );
    }
  }

  Future<void> update(ProductModel model) async {
    try {
      emit(state.copyWith(statusForm: ProductFormStatus.loading));

      await controller.post(model);

      emit(
        state.copyWith(
          statusForm: ProductFormStatus.updated,
          message: 'Produto atualizado com sucesso',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          statusForm: ProductFormStatus.error,
          message: 'Falha ao atualizar produto',
        ),
      );
    }
  }

  Future<void> get(String? id) async {
    try {
      emit(state.copyWith(statusForm: ProductFormStatus.loading));

      if (!id.isNull()) {
        await controller.get(id!);
      }

      emit(
        state.copyWith(
          statusForm: ProductFormStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          statusForm: ProductFormStatus.error,
          message: 'Falha ao carregar produto',
        ),
      );
    }
  }

  Future<void> setTitle(String? value) async {
    return emit(
      state.copyWith(
        hasChanged: true,
        title: value,
        description: state.description,
        price: state.price,
        typeProduct: state.typeProduct,
        url: state.url,
      ),
    );
  }

  Future<void> setDescription(String? value) async {
    return emit(
      state.copyWith(
        hasChanged: true,
        title: state.title,
        description: value,
        price: state.price,
        typeProduct: state.typeProduct,
        url: state.url,
      ),
    );
  }

  Future<void> setPrice(String? value) async {
    return emit(
      state.copyWith(
        hasChanged: true,
        title: state.title,
        description: state.description,
        price: value,
        typeProduct: state.typeProduct,
        url: state.url,
      ),
    );
  }

  Future<void> setTypeProduct(String? value) async {
    return emit(
      state.copyWith(
        hasChanged: true,
        title: state.title,
        description: state.description,
        price: state.price,
        typeProduct: value,
        url: '',
      ),
    );
  }

  Future<void> setImage(String? value) async {
    return emit(
      state.copyWith(
        hasChanged: true,
        title: state.title,
        description: state.description,
        price: state.price,
        typeProduct: state.typeProduct,
        url: value,
      ),
    );
  }
}
