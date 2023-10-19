import 'package:mobx/mobx.dart';

import '../models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaCarrinho = ObservableList<Item>();

  @observable
  double precoTotal = 0;

  @computed
  int get quantidadeCarrinho => listaCarrinho.length;

  @computed
  bool get carrinhoVazio => listaCarrinho.isEmpty;

  @action
  void adicionarItem(Item item) {
    listaCarrinho.add(item);
    precoTotal += item.preco;
  }

  @action
  void removerItem(Item item){
    listaCarrinho.remove(item);
    precoTotal -= item.preco;
  }
}
