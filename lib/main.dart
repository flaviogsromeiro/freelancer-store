import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/core/di/dependency_assembly.dart' as di;
import 'package:my_store/src/ini/firebase_options.dart';
import 'package:my_store/src/modules/home/view/pages/home_screen.dart';
import 'package:my_store/src/modules/product/view/bloc/product_bloc.dart';
import 'package:my_store/src/modules/user/view/bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.setupDependencyAssembly();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.dependencyAssembly<UserBloc>(),
        ),
        BlocProvider(
          create: (_) => di.dependencyAssembly<ProductBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color.fromARGB(255, 4, 125, 141)),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
