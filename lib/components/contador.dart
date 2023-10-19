import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:panucci_delivery/store/carrinho_store.dart';
import 'package:panucci_delivery/store/item_store.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class Contador extends StatelessWidget {
  final ItemStore itemStore = ItemStore();

  final Item item;

  Contador({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);

    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (itemStore.valorContador > 0) {
                itemStore.removerItem();
                carrinhoStore.removerItem(item);
              }
            },
            child: const Icon(
              Icons.remove_circle_outline,
              size: 20,
            ),
          ),
          Text(itemStore.valorContador.toString()),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              itemStore.adicionarItem();
              carrinhoStore.adicionarItem(item);
            },
            child: const Icon(
              Icons.add_circle_outline,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
