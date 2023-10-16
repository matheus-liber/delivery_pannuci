import 'package:mobx/mobx.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  int quantidadeCarinho = 0;

  @action
  void adicionarItem() {
    quantidadeCarinho++;
  }

  @action
  void removerItem(){
    quantidadeCarinho--;
  }
}
