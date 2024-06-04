// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_store/src/modules/product/model/product_model.dart';

enum ProductStatus { initial, loading, loaded, error }

class ProductState {
  final ProductStatus status;
  final List<ProductModel> listOfProduct;
  final List<ProductModel> listOfProductFiltered;
  final String? message;

  ProductState({
    required this.status,
    required this.listOfProduct,
    required this.listOfProductFiltered,
    this.message,
  });

  factory ProductState.initial() => ProductState(
        status: ProductStatus.initial,
        listOfProduct: [],
        listOfProductFiltered: [],
      );

  ProductState copyWith({
    ProductStatus? status,
    List<ProductModel>? listOfProduct,
    List<ProductModel>? listOfProductFiltered,
    String? message,
  }) {
    return ProductState(
      status: status ?? this.status,
      listOfProduct: listOfProduct ?? this.listOfProduct,
      listOfProductFiltered:
          listOfProductFiltered ?? this.listOfProductFiltered,
      message: message ?? this.message,
    );
  }
}
