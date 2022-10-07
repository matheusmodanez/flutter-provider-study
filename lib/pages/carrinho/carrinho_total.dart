import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:cart_provider_demo/models/compras.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrinhoTotal extends StatelessWidget {
  final ItemsComprados itemsComprados;

  const CarrinhoTotal({Key? key, required this.itemsComprados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CarrinhoTotal');

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CarrinhoModel>(
              builder: (context, cart, child) => Text(
                'R\$${cart.totalPrice}',
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(width: 24),
            _AddCompraButton(
              items: itemsComprados,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddCompraButton extends StatelessWidget {
  final ItemsComprados items;

  const _AddCompraButton({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: _AddCompraButton');

    var adicionado = context.select<ComprasModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (c) => c.items.contains(items),
    );

    //style: TextButton.styleFrom(foregroundColor: Colors.white),

    return IconButton(
      icon: adicionado
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : const Icon(Icons.add_shopping_cart),
      onPressed: adicionado
          ? null
          : () {
              var compra = context.read<ComprasModel>();
              compra.add(items);
              var carrinho = context.read<CarrinhoModel>();
              carrinho.removeAll();
              // const ScaffoldMessenger(
              //     child: Text('Compra Efetuada com Sucesso!'));
              Navigator.pop(context, '/compras');
            },
    );
  }
}
