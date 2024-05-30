import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/src/modules/user/controller/user_controller.dart';
import 'package:my_store/src/modules/user/view/bloc/user_bloc.dart';

final dependencyAssembly = GetIt.instance;

Future<void> setupDependencyAssembly() async {
  dependencyAssembly
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  _setupUser();
}

Future<void> _setupUser() async {
  dependencyAssembly

    // Bloc
    ..registerFactory<UserBloc>(
      () => UserBloc(dependencyAssembly()),
    )

    // Use Cases
    ..registerLazySingleton<UserController>(
      () => UserController(
          firebaseAuth: dependencyAssembly(),
          firebaseFirestore: dependencyAssembly()),
    );
}
