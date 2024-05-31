// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_store/src/modules/product/model/product_model.dart';

enum ProductStatus { initial, loading, loaded, error }

enum ProductFormStatus {
  initial,
  loading,
  loaded,
  created,
  updated,
  deleted,
  error
}

class ProductState {
  final ProductStatus status;
  final ProductFormStatus statusForm;
  final List<ProductModel> listOfProduct;
  final bool hasChanged;
  final String? title;
  final String? description;
  final String? price;
  final String? typeProduct;
  final String? url;
  final String? message;

  ProductState({
    required this.status,
    required this.statusForm,
    required this.listOfProduct,
    required this.hasChanged,
    this.title,
    this.description,
    this.price,
    this.typeProduct,
    this.url,
    this.message,
  });

  factory ProductState.initial() => ProductState(
        status: ProductStatus.initial,
        statusForm: ProductFormStatus.initial,
        listOfProduct: [],
        hasChanged: false,
      );

  ProductState copyWith({
    ProductStatus? status,
    ProductFormStatus? statusForm,
    List<ProductModel>? listOfProduct,
    bool? hasChanged,
    String? title,
    String? description,
    String? price,
    String? typeProduct,
    String? url,
    String? message,
  }) {
    return ProductState(
      status: status ?? this.status,
      statusForm: statusForm ?? this.statusForm,
      listOfProduct: listOfProduct ?? this.listOfProduct,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      typeProduct: typeProduct ?? this.typeProduct,
      url: url ?? this.url,
      message: message ?? this.message,
      hasChanged: hasChanged ?? this.hasChanged
    );
  }
}
