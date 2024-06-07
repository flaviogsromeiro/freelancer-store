// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/core/extensions/parser_extension_object.dart';
import 'package:my_store/src/modules/product/controller/product_controller.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';
import 'package:my_store/src/modules/product/view/bloc/form/product_form_state.dart';

class ProductFormBloc extends Cubit<ProductFormState> {
  final ProductController controller;
  

  ProductFormBloc(
    this.controller,
  ) : super(ProductFormState.initial());

  Future<void> create(ProductModel model) async {
    try {
      emit(state.copyWith(status: ProductFormStatus.loading));

      

      await controller.post(model);

      emit(
        state.copyWith(
          status: ProductFormStatus.created,
          message: 'Produto criado com sucesso',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductFormStatus.error,
          message: 'Falha ao criar produto',
        ),
      );
    }
  }

  Future<void> update(ProductModel model) async {
    try {
      emit(state.copyWith(status: ProductFormStatus.loading));

      await controller.put(model);

      emit(
        state.copyWith(
          status: ProductFormStatus.updated,
          message: 'Produto atualizado com sucesso',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductFormStatus.error,
          message: 'Falha ao atualizar produto',
        ),
      );
    }
  }

  Future<void> get(String? id) async {
    ProductModel? result;

    try {
      emit(state.copyWith(status: ProductFormStatus.loading));

      await Future.delayed(const Duration(seconds: 1));

      if (id.isNull()) {
        return emit(
          state.copyWith(
            status: ProductFormStatus.loaded,
          ),
        );
      } else {
        result = await controller.get(id!);
      }

      if (!result.isNull()) {
        return emit(
          state.copyWith(
              id: result!.id,
              status: ProductFormStatus.loaded,
              title: result.title,
              description: result.description,
              url: result.urlImage,
              price: result.price,
              typeProduct: result.type),
        );
      } else {
        return emit(
          state.copyWith(
            status: ProductFormStatus.error,
            message: 'Falha ao carregar produto',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          status: ProductFormStatus.error,
          message: 'Falha ao carregar produto',
        ),
      );
    }
  }

  Future<void> delete(String id) async {
    try {
      emit(state.copyWith(status: ProductFormStatus.loading));

      await Future.delayed(const Duration(seconds: 1));

      final isDeleted = await controller.delete(id);

      if (isDeleted) {
        return emit(
          state.copyWith(
              status: ProductFormStatus.deleted,
              message: 'Produto excluído com sucesso'),
        );
      } else {
        return emit(
          state.copyWith(
            status: ProductFormStatus.error,
            message: 'Falha ao excluir produto',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          status: ProductFormStatus.error,
          message: 'Falha ao excluir produto',
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

  Future<void> setTypeProduct(int? value) async {
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
