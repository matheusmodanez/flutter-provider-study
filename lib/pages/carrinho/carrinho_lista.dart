import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrinhoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('BUILD: CarrinhoLista');

    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var carrinho = context.watch<CarrinhoModel>();

    return ListView.builder(
      itemCount: carrinho.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image(
          image: AssetImage(
            'images/${carrinho.items[index].imagem}.jpeg',
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          ),
          onPressed: () {
            carrinho.remove(carrinho.items[index]);
          },
        ),
        title: Text(
          carrinho.items[index].nome,
        ),
        subtitle: Text(
          'R\$ ${carrinho.items[index].preco}',
        ),
      ),
    );
  }
}
