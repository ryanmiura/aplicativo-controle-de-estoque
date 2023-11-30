import 'package:controle_de_estoque/componentes/item_card.dart';
import 'package:flutter/material.dart';

class ItemInherited extends InheritedWidget {
  ItemInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<ItemCard> listaItens = [
    ItemCard(
        nome: 'Arroz',
        quantidade: 20,
        imagem:
            'https://pateko.com.br/novo/wp-content/uploads/2021/02/pateko-arroz-tipo1-5kg-copy-768x1016.png'),
    ItemCard(
        nome: 'Feijao',
        quantidade: 15,
        imagem: 'https://www.designi.com.br/images/preview/10010012.jpg'),
    ItemCard(
        nome: 'Bolacha',
        quantidade: 7,
        imagem:
            'https://w7.pngwing.com/pngs/667/674/png-transparent-saltine-cracker-graham-cracker-ritz-crackers-biscuit-wafer-biscuit-baked-goods-food-wafer.png'),
  ];

  void novoItem(String nom, int qtd, String img) {
    listaItens.add(ItemCard(nome: nom, quantidade: qtd, imagem: img));
  }

  static ItemInherited of(BuildContext context) {
    final ItemInherited? result =
        context.dependOnInheritedWidgetOfExactType<ItemInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ItemInherited old) {
    return old.listaItens.length != listaItens.length;
  }
}
