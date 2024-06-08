import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/core/di/dependency_assembly.dart' as di;
import 'package:my_store/src/ini/splash.dart';
import 'package:my_store/src/modules/product/view/bloc/list/product_bloc.dart';
import 'package:my_store/src/utils/style/styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.dependencyAssembly<ProductBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
          fontFamily: Styles.itimFont,
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
        ),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
