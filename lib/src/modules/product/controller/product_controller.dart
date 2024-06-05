import 'package:my_store/src/core/database/database_service.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';

class ProductController {
  final DatabaseService databaseService;

  ProductController({
    required this.databaseService,
  });

  Future<bool> delete(String id) async {
    try {
      await databaseService.delete(
          tableName: 'PRODUCTS', whereParams: 'ID = ?', whereValues: [id]);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ProductModel>> getAll() async {
    try {
      final result = await databaseService
          .list(tableName: 'PRODUCTS',);

      return List.from(result as List)
          .map<ProductModel>(
            (e) => ProductModel.fromMap(e as Map<String, dynamic>),
          )
          .toList();
          
    } catch (e) {
      return [];
    }
  }

  Future<ProductModel?> get(String id) async {
    try {
      final result = await databaseService.find(
          tableName: 'PRODUCTS', whereParams: 'ID = ? ', whereValues: [id]);

      return ProductModel.fromMap(result as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<bool> post(ProductModel model) async {
    try {
      await databaseService.insert(
          tableName: 'PRODUCTS', entity: model.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> put(ProductModel model) async {
    try {
      await databaseService.update(
          tableName: 'PRODUCTS',
          entity: model.toMap(),
          whereParams: 'ID = ?',
          whereValues: [model.id]);

      return true;
    } catch (error) {
      return false;
    }
  }
}
