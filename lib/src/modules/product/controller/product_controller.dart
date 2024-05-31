// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';

class ProductController {
  final FirebaseFirestore firebaseFirestore;

  ProductController({
    required this.firebaseFirestore,
  });

  Future<bool> delete(String id) async {
    try {
      await firebaseFirestore.collection('Products').doc(id).delete();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ProductModel>> getAll() async {
    List<Map<String, dynamic>> documentsData = [];

    try {
      QuerySnapshot<Map<String, dynamic>> products =
          await FirebaseFirestore.instance.collection('Products').get();

      for (var element in products.docs) {
        var item = element.data();

        item['id'] = element.id;

        documentsData.add(
          item,
        );
      }

      return [];
    } catch (e) {
      return [];
    }
  }
  Future<ProductModel> get(String id) async {
    List<Map<String, dynamic>> documentsData = [];

    try {
      QuerySnapshot<Map<String, dynamic>> products =
          await FirebaseFirestore.instance.collection('Products').get();

      for (var element in products.docs) {
        var item = element.data();

        item['id'] = element.id;

        documentsData.add(
          item,
        );
      }

      return ProductModel.instance();
    } catch (e) {
      return ProductModel.instance();
    }
  }

  Future<bool> post(ProductModel model) async {
    try {
      CollectionReference query =
          FirebaseFirestore.instance.collection('Products');

      await query.add(model.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> put(ProductModel model) async {
    try {
      CollectionReference query =
          FirebaseFirestore.instance.collection('Products');

      await query.doc(model.id).update(model.toMap());

      return true;
    } catch (error) {
      return false;
    }
  }

 
}
