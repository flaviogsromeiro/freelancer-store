import 'package:get_it/get_it.dart';
import 'package:my_store/src/core/database/database_helper.dart';
import 'package:my_store/src/core/database/database_service.dart';
import 'package:my_store/src/modules/product/controller/product_controller.dart';
import 'package:my_store/src/modules/product/view/bloc/form/product_form_bloc.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_bloc.dart';

final dependencyAssembly = GetIt.instance;

Future<void> setupDependencyAssembly() async {
  dependencyAssembly
    ..registerLazySingleton<DatabaseHelper>(DatabaseHelper.new)
    ..registerLazySingleton<DatabaseService>(
      () => DatabaseService(
        helper: dependencyAssembly(),
      ),
    );

  _setupProduct();
}

Future<void> _setupProduct() async {
  dependencyAssembly

    // Bloc
    ..registerFactory<ProductBloc>(
      () => ProductBloc(dependencyAssembly()),
    )
    ..registerFactory<ProductFormBloc>(
      () => ProductFormBloc(dependencyAssembly()),
    )

    // Use Cases
    ..registerLazySingleton<ProductController>(
      () => ProductController(databaseService: dependencyAssembly()),
    );
}
