import 'package:mobx/mobx.dart';

import '../models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaCarrinho = ObservableList<Item>();

  @computed
  int get quantidadeCarrinho => listaCarrinho.length;

  @computed
  bool get carrinhoVazio => listaCarrinho.isEmpty;

  @action
  void adicionarItem(Item item) {
    listaCarrinho.add(item);
  }

  @action
  void removerItem(Item item){
    listaCarrinho.remove(item);
  }
}
