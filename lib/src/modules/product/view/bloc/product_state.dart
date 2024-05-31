// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_store/src/modules/product/model/product_model.dart';

enum ProductStatus { initial, loading, loaded, error }

enum ProductFormStatus { initial, loading, loaded, created, updated, deleted, error }

class ProductState {
  final ProductStatus status;
  final ProductFormStatus statusForm;
  final List<ProductModel> listOfProduct;
  final String? message;

  ProductState({
    required this.status,
    required this.statusForm,
    required this.listOfProduct,
    this.message,
  });

  factory ProductState.initial() => ProductState(
        status: ProductStatus.initial,
        statusForm: ProductFormStatus.initial,
        listOfProduct: [],
      );

  ProductState copyWith({
    ProductStatus? status,
    ProductFormStatus? statusForm,
    List<ProductModel>? listOfProduct,
    String? message,
  }) {
    return ProductState(
      status: status ?? this.status,
      statusForm: statusForm ?? this.statusForm,
      listOfProduct: listOfProduct ?? this.listOfProduct,
      message: message ?? this.message,
    );
  }
}
