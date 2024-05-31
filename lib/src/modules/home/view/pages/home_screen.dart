import 'package:flutter/material.dart';
import 'package:my_store/src/modules/product/view/pages/products_list_screen.dart';
import 'package:my_store/src/modules/user/view/pages/login_screen.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';
import 'package:my_store/src/utils/style/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildDrawerBack() => Container(
          decoration: BoxDecoration(color: Styles.primary),
        );

    return Scaffold(
      appBar: AppBarSimple(
        title: 'My Store',
        leading: const Icon(Icons.menu),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Styles.primary,
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "My Store",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Olá, Flávio",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              child: Text(
                                "Sair",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                              },
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Minha Loja'),
              onTap: () {
                // Ação ao clicar em Home
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_mall),
              title: const Text('Meus Produtos'),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const ProductsListScreen();
              })),
            ),
            ListTile(
              leading: const Icon(Icons.local_grocery_store),
              title: const Text('Carrinho'),
              onTap: () {
                // Ação ao clicar em Contact
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
