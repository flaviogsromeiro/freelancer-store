// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ProductFormStatus {
  initial,
  loading,
  loaded,
  created,
  updated,
  deleted,
  error
}

class ProductFormState {
  final ProductFormStatus status;
  final String? message;
  final String? title;
  final String? id;
  final String? description;
  final String? price;
  final int? typeProduct;
  final String? url;
  final bool hasChanged;

  ProductFormState({
    required this.status,
    this.message,
    this.title,
    this.id,
    this.description,
    this.price,
    this.typeProduct,
    this.url,
    required this.hasChanged,
  });

  factory ProductFormState.initial() => ProductFormState(
        status: ProductFormStatus.initial,
        hasChanged: false,
      );

  ProductFormState copyWith({
    ProductFormStatus? status,
    String? message,
    String? title,
    String? id,
    String? description,
    String? price,
    int? typeProduct,
    String? url,
    bool? hasChanged,
  }) {
    return ProductFormState(
      status: status ?? this.status,
      message: message ?? this.message,
      title: title ?? this.title,
      id: id ?? this.id,
      description: description ?? this.description,
      price: price ?? this.price,
      typeProduct: typeProduct ?? this.typeProduct,
      url: url ?? this.url,
      hasChanged: hasChanged ?? this.hasChanged,
    );
  }
}
