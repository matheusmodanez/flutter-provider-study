import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:cart_provider_demo/pages/carrinho/carrinho-page.dart';
import 'package:cart_provider_demo/pages/catalogo/catalogo-page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/compras.dart';
import 'pages/compras/compras_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CarrinhoModel>(
          create: (context) => CarrinhoModel(),
        ),
        ChangeNotifierProvider<ComprasModel>(
          create: (context) => ComprasModel(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const CatalogoPage(),
            '/carrinho': (context) => const CarrinhoPage(),
            '/compras': (context) => const ComprasPage(),
          },
        );
      },
    );
  }
}
