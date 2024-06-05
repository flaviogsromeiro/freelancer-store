// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String? id;
  final String title;
  final String description;
  final int type;
  final String urlImage;
  final String price;

  ProductModel({
    this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.urlImage,
    required this.price,
  });

  factory ProductModel.instance() => ProductModel(
        title: '',
        description: '',
        type: 0,
        urlImage: '',
        price: '',
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': id,
      'TITLE': title,
      'DESCRIPTION': description,
      'TYPE': type,
      'URLIMAGE': urlImage,
      'PRICE': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['ID'] != null ? map['ID'] as String : null,
      title: map['TITLE'] as String,
      description: map['DESCRIPTION'] as String,
      type: map['TYPE'] as int,
      urlImage: map['URLIMAGE'] as String,
      price: map['PRICE'] as String,
    );
  }
}
