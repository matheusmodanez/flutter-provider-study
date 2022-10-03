import 'package:badges/badges.dart';
import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    print('BUILD: CatalogoAppBar');

    final carrinho = Provider.of<CarrinhoModel>(context);
    return AppBar(
      title: const Text('Catalogo'),
      actions: [
        IconButton(
          icon: Badge(
            badgeContent: Text(
              '${carrinho.items.length}',
              style: TextStyle(color: Colors.white),
            ),
            child: const Icon(
              Icons.shopping_cart,
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, '/carrinho'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
