import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:cart_provider_demo/models/catalogo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/compras.dart';

class ComprasPage extends StatelessWidget {
  final ComprasModel? compra;

  const ComprasPage({Key? key, this.compra}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: ComprasPage');

    var compras = context.select<ComprasModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (c) => c.items.isNotEmpty,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Minhas Compras'),
        ),
        body: compras
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ComprasModel>(
                    builder: (context, compra, child) => Text(
                      compra.items[0].items[0].nome,
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )
            // compra!.items.map((ItemsComprados itemsComprados) {
            //       return Text('$itemsComprados');
            //     }).toList())
            : null);
  }
}
